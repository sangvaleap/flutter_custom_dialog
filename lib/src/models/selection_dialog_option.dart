import 'package:flutter/material.dart';

class SelectionDialogOption {
  String key;
  IconData? icon;
  String text;

  SelectionDialogOption({
    required this.key,
    required this.text,
    this.icon,
  });
}
