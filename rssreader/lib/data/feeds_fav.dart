import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/feed.dart';

class FeedFavourites {
  Map<String, Feed> feeds = {};

  static final FeedFavourites _instance = FeedFavourites._internal();

  factory FeedFavourites() => _instance;

  FeedFavourites._internal();

  addFavourite(Feed feed) {
    feeds[feed.guid] = feed;
    saveFeeds();
  }

  removeFaouvorite(String guid) {
    feeds.remove(guid);
    saveFeeds();
  }

  Future<List<Feed>> getFeeds() async {
    if (feeds.values.isNotEmpty) return feeds.values.toList();
    try {
      Directory appDocDir = await getApplicationSupportDirectory();
      File file = File('${appDocDir.path}/favourites.json');
      if (await file.exists()) {
        String fileContent = await file.readAsString();
        Map<String, dynamic> json = jsonDecode(fileContent);
        if (!json.containsKey('favourites')) Exception('favourites not found');
        List<dynamic> favourites = json['favourites'];
        for (Map<String, dynamic> feedJson in favourites) {
          Feed feed = Feed.fromJson(feedJson);
          if (!feeds.keys.contains(feed.guid)) {
            feeds[feed.guid] = feed;
          }
        }
      }
    } catch (e) {
      return [];
    }
    return feeds.values.toList();
  }

  saveFeeds() async {
    Directory appDocDir = await getApplicationSupportDirectory();
    Map<String, dynamic> json = {'favourites': []};
    for (Feed feed in feeds.values) {
      json['favourites'].add(feed.toJson());
    }
    File file = File('${appDocDir.path}/favourites.json');
    file.writeAsString(jsonEncode(json));
  }
}
