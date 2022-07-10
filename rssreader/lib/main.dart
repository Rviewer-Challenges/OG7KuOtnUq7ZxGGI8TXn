import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rssreader/config/theme_data.dart';

import 'package:rssreader/providers/theme.dart';
import 'package:rssreader/views/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ThemeChanger(BrandThemeData.light()),
      child: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);
    return MaterialApp(
      title: 'RSS Reader',
      theme: theme.getThemeData(),
      home: const Home(),
    );
  }
}
