import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyMessenger{
  static messenger(BuildContext context, String text, Color color)=>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: color,
      )
    );
}