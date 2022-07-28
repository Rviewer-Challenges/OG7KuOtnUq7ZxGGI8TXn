// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:rssreader/data/feeds_fav.dart';
import 'package:rssreader/models/feed.dart';
import 'package:rssreader/utils/date_parser.dart';
import 'package:rssreader/views/screens/feed_detail.dart';

class FeedItem extends StatefulWidget {
  final Feed feed;
  final bool isFav;

  const FeedItem({Key? key, required this.feed, this.isFav = false})
      : super(key: key);

  @override
  State<FeedItem> createState() => _FeedItemState();
}

class _FeedItemState extends State<FeedItem> {
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
                FavouriteButton(
                  feed: widget.feed,
                  isFav: widget.isFav,
                ),
                Text(widget.feed.source, textScaleFactor: 0.75),
                Text(
                    "- ${widget.feed.pubDate.day} de ${DateEspEn.monthName[widget.feed.pubDate.month]} ${widget.feed.pubDate.year} -",
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
                        widget.feed.title,
                        style: const TextStyle(fontSize: 20),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: widget.feed.urlImage != null
                              ? Image.network(widget.feed.urlImage!,
                                  fit: BoxFit.cover)
                              : Image.asset('assets/placeholder/no_image.jpg',
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
                      builder: ((context) => FeedDetailScreen(widget.feed)),
                    ),
                  )),
        ],
      ),
    );
  }
}

class FavouriteButton extends StatefulWidget {
  bool isFav;
  final Feed feed;
  FavouriteButton({Key? key, required this.feed, this.isFav = false})
      : super(key: key);

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      onTap: () => setState(() {
        widget.isFav = !widget.isFav;
        if (widget.isFav) {
          FeedFavourites().addFavourite(widget.feed);
        } else {
          FeedFavourites().removeFaouvorite(widget.feed.guid);
        }
      }),
      child: widget.isFav
          ? const Icon(Icons.star)
          : const Icon(Icons.star_border_outlined),
    );
  }
}
