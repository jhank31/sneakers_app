import 'package:flutter/material.dart';

class TitleTextAuth extends StatelessWidget {
  final String title;
  const TitleTextAuth({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
