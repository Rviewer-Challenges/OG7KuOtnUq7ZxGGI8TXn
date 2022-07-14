import 'package:flutter/material.dart';
import 'package:rssreader/views/screens/main_feeds.dart';
import 'package:rssreader/views/screens/settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget contentBody = Container();
  int tabIndex = 0;
  PageController controller = PageController(initialPage: 0);

  List<Widget> pages = [MainFeedsScreen(), Container(), const SettingsScreen()];

  void _bodyChange(int index) {
    setState(() {
      tabIndex = index;
      controller.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('RSS Reader'))),
      body: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
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
