import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rssreader/config/sources_config.dart';
import 'package:rssreader/config/theme_data.dart';
import 'package:rssreader/providers/setting_preferences.dart';

import '../../models/source.dart';
import '../../providers/theme_provider.dart';
import '../../config/sources_config.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingPreferences settings = SettingPreferences();
  final Map<String, SourceFeed> _sources = <String, SourceFeed>{
    for (SourceFeed src in sourcesConfig) src.name: src
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
        TextButton(onPressed: settings.restore, child: Text('Restaurar')),
      ],
    );
  }

  Row _themeSwitch(ThemeChanger theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text('Dark mode'),
        Switch(
          value: settings.darkMode,
          onChanged: (bool? value) {
            settings.darkMode = value ?? false;
            theme.setThemeData(settings.darkMode
                ? BrandThemeData.dark()
                : BrandThemeData.light());
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
            const Text('SOURCES'),
            for (var name in names)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(name),
                  Switch(
                    value: _sources[name]!.active,
                    onChanged: (bool active) {
                      setState(() {
                        settings.setSourceFeed(_sources[name]!.url, active);
                        _sources[name]?.active = active;
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
