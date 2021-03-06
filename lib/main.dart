import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/screens/trending_screen.dart';
import 'package:news_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './models/country_model.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var isDarkTheme = prefs.getBool("isDarkTheme") ?? false;
    return runApp(
      ChangeNotifierProvider<ThemeProvider>(
        child: MyApp(),
        create: (BuildContext context) {
          return ThemeProvider(isDarkMode: isDarkTheme);
        },
      ),
    );
  });
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List screens = [
    HomeScreen(),
    SearchScreen(),
    TrendingScreen(),
    SettingsScreen(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<ThemeProvider>(
            create: (BuildContext context) {
              return themeProvider;
            },
          ),
          ChangeNotifierProvider<CountryModel>(create: (BuildContext context) {
            return CountryModel();
          }),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.getTheme(),
          home: Scaffold(
            bottomNavigationBar: BottomNavigationBarTheme(
              data: themeProvider.getTheme().bottomNavigationBarTheme,
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (value) {
                  currentIndex = value;
                  setState(() {});
                },
                type: BottomNavigationBarType.shifting,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: "Search",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.trending_up),
                    label: "Trending",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: "Settings",
                  ),
                ],
              ),
            ),
            body: screens[currentIndex],
          ),
        ),
      );
    });
  }
}
