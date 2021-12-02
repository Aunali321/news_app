import 'package:flutter/cupertino.dart';

class CountryModel extends ChangeNotifier {
  final countries = {
    'India': 'in',
    'USA': "us",
    'Australia': "au",
    'Russia': "ru",
    'France': "fr",
    'United Kingdom': "gb",
  };

  var selectedCountry = 'us';

  void changeCountry(String country) {
    selectedCountry = countries[country];
    notifyListeners();
  }
}
