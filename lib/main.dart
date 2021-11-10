import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:news_app/screens/settings_screen.dart';
import 'package:news_app/screens/trending_screen.dart';
import 'package:news_app/theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isDarkModeOn;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isDarkModeOn = prefs.getBool('isDarkTheme');

  return runApp(ChangeNotifierProvider(
    child: MyApp(),
    create: (BuildContext context) =>
        ThemeProvider(isDarkMode: prefs.getBool('isDarkTheme')),
  ));
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
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeProvider.getTheme,
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBarTheme(
            data: BottomNavigationBarThemeData(
              unselectedItemColor:
                  isDarkModeOn != null ? Colors.white : Colors.black,
              selectedItemColor: Colors.blue,
              elevation: 50,
            ),
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
      );
    });
  }
}
