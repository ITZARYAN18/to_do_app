import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String? text;
  voidCallback onPressed;
   Buttons({
    super.key,
    required this.text,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: , child: Text("Save"));
  }
}
