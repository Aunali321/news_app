import 'package:flutter/material.dart';
import 'package:news_app/theme.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'Settings Page',
              style: Theme.of(context).textTheme.headline5,
            ),
            ListTile(
              leading: Text("Dark Mode"),
              trailing: IconButton(
                icon: Icon(Icons.brightness_6),
                onPressed: () {
                  ThemeProvider themeProvider = Provider.of<ThemeProvider>(
                    context,
                    listen: false,
                  );
                  setState(() {
                    themeProvider.swapTheme();
                  });
                },
              ),
            ),
            DropdownButton(
              hint: Text('Select News Language'),
              items: [
                DropdownMenuItem(
                  child: Text('English'),
                  value: 'English',
                ),
                DropdownMenuItem(
                  child: Text('Hindi'),
                  value: 'Hindi',
                ),
              ],
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
