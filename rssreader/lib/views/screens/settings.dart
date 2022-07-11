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
  final Map<String, bool> _sources = {
    'Source 1': true,
    'Source 2': false,
    'Source 3': false,
    'Source 4': false,
    'Source 5': false,
    'Source 6': false
  };
  @override
  Widget build(BuildContext context) {
    final ThemeChanger theme = Provider.of<ThemeChanger>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _themeSwitch(theme),
        ),
        _currentSources(),
      ],
    );
  }

  Row _themeSwitch(ThemeChanger theme) {
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

  Widget _currentSources() {
    List<String> names = _sources.keys.toList();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('SOURCES'),
            for (var name in names)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(name),
                  Switch(
                    value: _sources[name]!,
                    onChanged: (bool active) {
                      setState(() {
                        _sources[name] = !_sources[name]!;
                      });
                    },
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
