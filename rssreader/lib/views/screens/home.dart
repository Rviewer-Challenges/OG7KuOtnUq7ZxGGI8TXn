import 'package:flutter/material.dart';
import 'package:rssreader/views/screens/settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget contentBody = Container();
  int tabIndex = 0;

  void _bodyChange(int index) {
    setState(() {
      tabIndex = index;
      switch (index) {
        case 2:
          contentBody = const SettingsScreen();
          break;
        default:
          contentBody = Container();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('RSS Reader'))),
      body: contentBody,
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
