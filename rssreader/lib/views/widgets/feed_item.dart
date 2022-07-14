import 'package:flutter/material.dart';
import 'package:rssreader/models/feed.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FeedItem extends StatelessWidget {
  final Feed feed;

  const FeedItem({Key? key, required this.feed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    feed.title,
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    feed.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(18)),
                child: SizedBox(
                  height: 100,
                  width: 300,
                  child: feed.urlImage != null
                      ? Image.network(feed.urlImage!, fit: BoxFit.cover)
                      : Image.asset('assets/placeholder/pexels.jpg',
                          fit: BoxFit.cover),
                ),
              ),
            ),
          ],
        ),
        onTap: () async => await launchUrlString(feed.link),
      ),
    );
  }
}
