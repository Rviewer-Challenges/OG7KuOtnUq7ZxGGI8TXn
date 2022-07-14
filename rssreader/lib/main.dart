import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rssreader/config/sources_config.dart';
import 'package:rssreader/config/theme_data.dart';
import 'package:rssreader/providers/setting_preferences.dart';

import 'package:rssreader/providers/theme_provider.dart';
import 'package:rssreader/views/screens/home.dart';

import './config/sources_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settings = SettingPreferences();
  await settings.init();
  for (var src in sourcesConfig) {
    src.active = settings.sourceIsActive(src.url);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final SettingPreferences settings = SettingPreferences();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ThemeChanger(
          settings.darkMode ? BrandThemeData.dark() : BrandThemeData.light()),
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
      debugShowCheckedModeBanner: false,
      title: 'RSS Reader',
      theme: theme.getThemeData(),
      home: const Home(),
    );
  }
}
