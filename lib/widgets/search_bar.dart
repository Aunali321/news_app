import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  SearchBar({
    Key key,
    @required this.queryPassed,
  }) : super(key: key);

  final Function queryPassed;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  String textInput;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onSubmitted: widget.queryPassed,
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,
                contentPadding: EdgeInsets.all(14.0),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color(0x95000000),
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color(0x95000000),
                  size: 24.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(
                fontFamily: 'Poppins',
                color: Color(0xFF000000),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
