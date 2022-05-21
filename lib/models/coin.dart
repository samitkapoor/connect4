import 'package:flutter/material.dart';

class Coin {
  int row;
  int column;
  bool selected;
  Color color;
  Coin({
    required this.row,
    required this.column,
    required this.selected,
    required this.color,
  });
}
