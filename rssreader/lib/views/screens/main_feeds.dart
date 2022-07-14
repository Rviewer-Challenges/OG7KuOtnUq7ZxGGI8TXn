import 'package:flutter/material.dart';
import 'package:rssreader/config/sources_config.dart';
import 'package:rssreader/data/feeds_request.dart';

import '../../models/feed.dart';
import '../widgets/feed_item.dart';
import '../../config/sources_config.dart';

class MainFeedsScreen extends StatefulWidget {
  MainFeedsScreen({Key? key}) : super(key: key);
  final FeedRequest request = FeedRequest(sourcesConfig);
  @override
  State<MainFeedsScreen> createState() => _MainFeedsScreenState();
}

class _MainFeedsScreenState extends State<MainFeedsScreen> {
  Future<void> _refreshFeeds() async {
    await widget.request.updateFeeds(20);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: _refreshFeeds,
      child: widget.request.feeds.isEmpty
          ? FutureBuilder(
              future: widget.request.getFeeds(),
              builder: (context, AsyncSnapshot<List<Feed>> snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) =>
                        FeedItem(feed: snapshot.data![index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(
                      thickness: 4,
                      indent: 32,
                      endIndent: 32,
                    ),
                  );
                }
                return const Center(child: CircularProgressIndicator());
              })
          : ListView.separated(
              itemCount: widget.request.getTop(20).length,
              itemBuilder: (BuildContext context, int index) =>
                  FeedItem(feed: widget.request.getFeedAt(index)),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                thickness: 4,
                indent: 32,
                endIndent: 32,
              ),
            ),
    );
  }
}
