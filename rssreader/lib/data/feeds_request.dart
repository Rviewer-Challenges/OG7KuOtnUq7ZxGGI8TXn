import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:rssreader/utils/date_parser.dart';
import 'package:xml/xml.dart' as xml;

import 'package:rssreader/models/feed.dart';
import 'package:rssreader/models/source.dart';

class FeedRequest {
  List<SourceFeed> sources;
  Map<String, Feed> feeds = {};
  List<Feed> top = [];

  FeedRequest(this.sources);

  List<Feed> getTop(int topAmount) {
    List<Feed> listFeeds = feeds.values.toList();
    listFeeds.sort((a, b) => b.pubDate.compareTo(a.pubDate));
    listFeeds.forEach((element) {
      print(element.guid);
    });
    top = listFeeds.sublist(0, min(topAmount, feeds.values.length));
    top.forEach((element) {
      print('Top ${element.guid}');
    });
    return top;
  }

  Feed getFeedAt(int index) => top[index];

  Future<List<Feed>> getFeeds([int amount = 10]) async {
    for (var source in sources) {
      if (source.isNotActive) continue;
      http.Response response = await http.get(Uri.parse(source.url));
      if (response.statusCode == 200 || response.statusCode == 201) {
        xml.XmlDocument rssDoc = xml.XmlDocument.parse(response.body);
        // RegExp cddataExp = RegExp(r'<!\[CDATA\[(.*?)\]\]>');
        RegExp removeTags = RegExp(r'<[^>]*>');

        Iterable<xml.XmlElement?> items = rssDoc.findAllElements('item');
        if (items.isNotEmpty) {
          for (int i = 0; i < min(amount, items.length); i++) {
            String? guid = items.elementAt(i)?.findElements('guid').first.text;
            if (guid == null || feeds.containsKey(guid)) {
              continue;
            }
            Iterable<xml.XmlElement?> title =
                items.elementAt(i)!.findElements('title');
            Iterable<xml.XmlElement?> description =
                items.elementAt(i)!.findElements('description');
            Iterable<xml.XmlElement?> imageUri =
                items.elementAt(i)!.findElements('media:content');
            Iterable<xml.XmlElement?> link =
                items.elementAt(i)!.findElements('link');
            Iterable<xml.XmlElement?> pubdate =
                items.elementAt(i)!.findElements('pubDate');
            feeds[guid] = Feed(
              guid: guid,
              title: title.isNotEmpty
                  ? title.first?.text.replaceAll(removeTags, ' ')
                  : null,
              description: description.isNotEmpty
                  ? description.first?.text.replaceAll(removeTags, ' ')
                  : null,
              urlImage: imageUri.isNotEmpty
                  ? imageUri.first?.getAttribute('url')
                  : null,
              link: link.isNotEmpty
                  ? link.first!.text.replaceAll(removeTags, ' ')
                  : '',
              pubDate: HttpDate.parse(DateEspEn.parse(pubdate.first!.text)
                  .replaceFirst(RegExp(r'\+\d+'), 'GMT')),
            );
          }
        }
      }
    }

    return getTop(amount);
  }

  Future<List<Feed>> updateFeeds([int amount = 10]) async {
    feeds.clear();
    return getFeeds(amount);
  }
}
