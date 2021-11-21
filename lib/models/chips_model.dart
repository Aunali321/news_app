import 'package:flutter/material.dart';

class ChipModel {
  Text label;
  Color backgroundColor;
  bool isSelected;
  OutlinedBorder shape;
  Function onSelected;

  ChipModel({
    this.label,
    this.backgroundColor,
    this.isSelected,
    this.shape,
    this.onSelected,
  });

  static List<ChipModel> categories = [
    ChipModel(
      label: Text("Technology"),
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
    ChipModel(
      label: Text("Business"),
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
    ChipModel(
      label: Text("Science"),
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
    ChipModel(
      label: Text("Health"),
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
    ChipModel(
      label: Text("General"),
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
    ChipModel(
      label: Text("Entertainment"),
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
    ChipModel(
      label: Text("Sports"),
      onSelected: (value) {},
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(side: BorderSide()),
      isSelected: false,
    ),
  ];
}
