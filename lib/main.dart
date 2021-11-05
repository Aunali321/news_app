import 'package:flutter/material.dart';
import 'package:news_app/screens/home_screen.dart';
import 'package:news_app/screens/search_screen.dart';
import 'package:news_app/screens/trending_screen.dart';

void main() {
  runApp(MyApp());
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
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBarTheme(
          data: BottomNavigationBarThemeData(
              unselectedItemColor: Colors.black,
              selectedItemColor: Colors.blue,
              elevation: 50),
          child: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
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
                icon: Icon(Icons.account_circle),
                label: "Trending",
              ),
            ],
          ),
        ),
        body: screens[currentIndex],
      ),
    );
  }
}
