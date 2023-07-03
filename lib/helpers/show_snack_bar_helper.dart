


import 'package:blog_app/constants/dimension_constants.dart';
import 'package:flutter/material.dart';

void showSnackBarHelper(String content, Color color, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content, style: const TextStyle(color: Colors.white, fontSize: kDefaultPadding)),
    backgroundColor: color,
  ));
}