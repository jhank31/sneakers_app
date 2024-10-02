import 'package:flutter/material.dart';

class AppBottomSheet {
  static Future<void> display(BuildContext context, Widget widget) async {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (_) => widget,
    );
  }
}
