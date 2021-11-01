import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 40,
      // decoration: BoxDecoration(
      //   color: Colors.grey[300],
      //   borderRadius: BorderRadius.circular(10),
      // ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.grey[300],
                filled: true,
                hintText: "Search",
                hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                ),
                prefix: Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Image.asset(
                    "assets/images/search.png",
                    alignment: Alignment.bottomLeft,
                    scale: 1.3,
                    color: const Color(0x95000000),
                    height: 28,
                  ),
                ),
                contentPadding: EdgeInsets.only(left: 18),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          // MaterialButton(
          //   onPressed: () {},
          //   child: Image.asset(
          //     "assets/images/search.png",
          //     scale: 1.3,
          //     color: const Color(0x95000000),
          //   ),
          //   minWidth: 10,
          // ),
          // const Text(
          //   "Search",
          //   style: TextStyle(
          //     color: Color(0x95000000),
          //   ),
          // ),
        ],
      ),
    );
  }
}
