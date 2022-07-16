import 'package:flutter/material.dart';
import 'package:rssreader/models/feed.dart';
import 'package:rssreader/utils/date_parser.dart';
import 'package:rssreader/views/screens/feed_detail.dart';

class FeedItem extends StatelessWidget {
  final Feed feed;

  const FeedItem({Key? key, required this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.star_border),
                Text(feed.source, textScaleFactor: 0.75),
                Text(
                    "- ${feed.pubDate.day} ${DateEspEn.monthName[feed.pubDate.month]} ${feed.pubDate.year} -",
                    textScaleFactor: 0.75),
              ],
            ),
          ),
          InkWell(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        feed.title,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: feed.urlImage != null
                              ? Image.network(feed.urlImage!, fit: BoxFit.cover)
                              : Image.asset('assets/placeholder/pexels.jpg',
                                  fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => FeedDetailScreen(feed)),
                    ),
                  )),
        ],
      ),
    );
  }
}
