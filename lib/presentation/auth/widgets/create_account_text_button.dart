import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreateAccountTextButton extends StatelessWidget {
  const CreateAccountTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Don\'t have an account?',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {
            context.push('/register');
          },
          child: const Text(
            'Create one',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        )
      ],
    );
  }
}
