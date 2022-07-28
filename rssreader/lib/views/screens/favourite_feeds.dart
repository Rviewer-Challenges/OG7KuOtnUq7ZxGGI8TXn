import 'package:flutter/material.dart';
import 'package:rssreader/data/feeds_fav.dart';

import '../../models/feed.dart';
import '../widgets/feed_item.dart';

class FavouriteFeedsScreen extends StatefulWidget {
  const FavouriteFeedsScreen({Key? key}) : super(key: key);
  @override
  State<FavouriteFeedsScreen> createState() => _FavouriteFeedsScreenState();
}

class _FavouriteFeedsScreenState extends State<FavouriteFeedsScreen> {
  FeedFavourites feeds = FeedFavourites();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: feeds.getFeeds(),
        builder: (context, AsyncSnapshot<List<Feed>> snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) => FeedItem(
                feed: snapshot.data![index],
                isFav: feeds.feeds.containsKey(snapshot.data![index].guid),
              ),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                thickness: 4,
                indent: 24,
                endIndent: 24,
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        });
  }
}
