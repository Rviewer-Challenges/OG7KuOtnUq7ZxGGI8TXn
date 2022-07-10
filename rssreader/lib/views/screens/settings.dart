import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rssreader/config/theme_data.dart';

import '../../providers/theme.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    final ThemeChanger theme = Provider.of<ThemeChanger>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Dark mode'),
        Switch(
          value: isDark,
          onChanged: (bool? value) {
            isDark = value ?? false;
            theme.setThemeData(
                isDark ? BrandThemeData.dark() : BrandThemeData.light());
          },
        ),
      ],
    );
  }
}
