import 'package:chat_master/others/super_provider.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SuperDrawer extends StatefulWidget {
  const SuperDrawer({Key? key}) : super(key: key);

  @override
  State<SuperDrawer> createState() => _SuperDrawerState();
}

class _SuperDrawerState extends State<SuperDrawer> {
  @override
  Widget build(BuildContext context) {
    var themeProvider = context.watch<ThemeProvider>();
    bool _value =
        themeProvider.selectedThemeMode == ThemeMode.light ? false : true;

    return Drawer(
      elevation: 100,
      child: ListView(
        reverse: true,
        padding: EdgeInsets.zero,
        children: [
          Card(
            child: ListTile(
              leading: _value
                  ? const Icon(EvaIcons.moonOutline)
                  : const Icon(EvaIcons.sunOutline),
              title:
                  _value ? const Text('Dark mode') : const Text('Light mode'),
              trailing: Switch.adaptive(
                value: _value,
                onChanged: (value) {
                  setState(() => _value = value);
                  _value
                      ? themeProvider.setSelectedThemeMode(ThemeMode.dark)
                      : themeProvider.setSelectedThemeMode(ThemeMode.light);
                },
              ),
              onTap: () {
                setState(() => _value = !_value);
                _value
                    ? themeProvider.setSelectedThemeMode(ThemeMode.dark)
                    : themeProvider.setSelectedThemeMode(ThemeMode.light);
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.settings_outlined),
              title: const Text('Settings'),
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
