import 'package:flutter/material.dart';

class ChoiceChips extends StatefulWidget {
  ChoiceChips({Key key, this.chipCallback}) : super(key: key);

  final Function chipCallback;

  final List<String> chipList = [
    "Technology",
    "Business",
    "Science",
    "Health",
    "General",
    "Entertainment",
    "Sports",
  ];

  @override
  _ChoiceChipsState createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {
  String selectedChoice = "Technology";
  String selectedChip;

  _buildChoiceList() {
    List<Widget> choices = [];
    widget.chipList.forEach((item) {
      choices.add(Container(
        padding: const EdgeInsets.only(left: 2, right: 6, top: 2, bottom: 2),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(
              color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          backgroundColor: Color(0xffededed),
          selectedColor: Colors.blue,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
              selectedChip = item;
              widget.chipCallback;
            });
          },
        ),
      ));
    });
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildChoiceList(),
      ),
    );
  }
}
