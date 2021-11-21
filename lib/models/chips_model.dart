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
}
