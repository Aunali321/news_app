import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu),
                padding: EdgeInsets.zero,
                iconSize: 28,
                alignment: Alignment.centerLeft,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Discover",
                style: kBoldText,
              ),
              const Text(
                "News from all over the world",
                style: kSmallText,
              ),
              const SizedBox(
                height: 20,
              ),
              const SearchBar(),
            ],
          ),
        ),
      ),
    );
  }
}
