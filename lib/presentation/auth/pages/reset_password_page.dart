import 'package:e_commers_app/common/widgets/widgets.dart';
import 'package:e_commers_app/presentation/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleTextAuth(
              title: 'Reset Password',
            ),
            const SizedBox(
              height: 20,
            ),
            const TextFieldAuth(
              hintText: 'Enter Email Address',
            ),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(
              onPressed: () {},
              title: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
