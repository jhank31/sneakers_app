import 'package:flutter/material.dart';

class TextFieldAuth extends StatelessWidget {
  final String hintText;
  const TextFieldAuth({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
