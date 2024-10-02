import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Forgot password?',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            context.push('/reset-password');
          },
          child: const Text(
            'Reset',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
