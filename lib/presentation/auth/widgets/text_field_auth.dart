import 'package:flutter/material.dart';

class TextFieldAuth extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  const TextFieldAuth(
      {super.key, required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (value) {
        
      // },
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
