import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/models/country_model.dart';
import 'package:news_app/theme.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String dropDownValue = "India";
  @override
  Widget build(BuildContext context) {
    final countries = Provider.of<CountryModel>(context).countries;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
        centerTitle: Theme.of(context).appBarTheme.centerTitle,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        elevation: 2.0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Text(
                "Dark Mode",
                style: kArticleTitle,
              ),
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
            ListTile(
              leading: Text(
                "Select Country",
                style: kArticleTitle,
              ),
              trailing: DropdownButton(
                  hint: Text('Select Country'),
                  value: dropDownValue,
                  onChanged: (value) {
                    setState(() {
                      dropDownValue = value;

                      Provider.of<CountryModel>(context, listen: false)
                          .changeCountry(value);
                      dropDownValue =
                          Provider.of<CountryModel>(context).selectedCountry;
                    });
                  },
                  items: List<DropdownMenuItem>.from(
                      countries.entries.map((country) {
                    return DropdownMenuItem(
                      value: country.key,
                      child: Text(country.key),
                    );
                  })).toList()),
            ),
          ],
        ),
      ),
    );
  }
}
