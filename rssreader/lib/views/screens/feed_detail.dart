import 'package:flutter/material.dart';
import 'package:rssreader/models/feed.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../utils/date_parser.dart';

class FeedDetailScreen extends StatelessWidget {
  final Feed feed;
  const FeedDetailScreen(this.feed, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(feed.source), centerTitle: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(feed.title, style: const TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: feed.urlImage != null
                    ? Image.network(feed.urlImage!)
                    : null,
              ),
              Text(
                  "- ${feed.pubDate.day} ${DateEspEn.monthName[feed.pubDate.month]} ${feed.pubDate.year} -",
                  textScaleFactor: 0.75),
              Text(feed.description, style: const TextStyle(fontSize: 16))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        label: const Text('Ver noticia'),
        icon: const Icon(Icons.arrow_circle_right_outlined),
        onPressed: () => launchUrlString(feed.link),
      ),
    );
  }
}
