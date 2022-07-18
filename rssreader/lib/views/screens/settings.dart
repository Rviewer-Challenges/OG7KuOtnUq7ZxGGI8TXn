import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rssreader/config/sources_config.dart';
import 'package:rssreader/config/theme_brand.dart';
import 'package:rssreader/data/setting_preferences.dart';

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
  late Map<String, SourceFeed> _sources = _load();

  Map<String, SourceFeed> _load() {
    return <String, SourceFeed>{
      for (SourceFeed src in sourcesConfig) src.name: src
    };
  }

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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: OutlinedButton(
              onPressed: () async {
                settings.restore.call().then((value) {
                  if (value) {
                    _sources.clear();
                    for (var src in sourcesConfig) {
                      src.active = settings.sourceIsActive(src.url);
                    }
                    _sources = _load();
                    theme.setThemeData(settings.darkMode
                        ? BrandThemeData.dark()
                        : BrandThemeData.light());
                    setState(() {});
                  }
                });
              },
              child: const Text('Reset')),
        ),
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
        padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 64),
        child: Column(
          children: [
            const Text('SOURCES'),
            for (var name in names)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
          ],
        ),
      ),
    );
  }
}
