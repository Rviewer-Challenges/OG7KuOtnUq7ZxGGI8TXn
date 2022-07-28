import 'package:flutter/material.dart';
import 'package:rssreader/views/screens/favourite_feeds.dart';
import 'package:rssreader/views/screens/main_feeds.dart';
import 'package:rssreader/views/screens/settings.dart';

import '../../data/feeds_fav.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget contentBody = Container();
  int tabIndex = 0;
  PageController controller = PageController(initialPage: 0);

  List<Widget> pages = [
    MainFeedsScreen(),
    const FavouriteFeedsScreen(),
    const SettingsScreen()
  ];

  void _bodyChange(int index) {
    setState(() {
      tabIndex = index;
      controller.jumpToPage(index);
    });
  }

  @override
  void dispose() async {
    await FeedFavourites().saveFeeds();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Game Dev RSS'))),
      body: PageView(
        controller: controller,
        // physics: const NeverScrollableScrollPhysics(),
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'FAVS'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'SET'),
        ],
        onTap: (int index) => _bodyChange(index),
      ),
    );
  }
}
