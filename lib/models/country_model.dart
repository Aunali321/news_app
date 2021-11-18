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

  var selectedCountry = 'in';

  void changeCountry(String country) {
    selectedCountry = countries[country];
    notifyListeners();
    print(selectedCountry);
  }
}
