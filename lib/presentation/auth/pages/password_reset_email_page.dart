import 'package:e_commers_app/common/widgets/button/basic_app_button.dart';
import 'package:e_commers_app/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class PasswordResetEmailPage extends StatelessWidget {
  const PasswordResetEmailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SvgPicture.asset(AppVectors.emailSending),
          ),
          const SizedBox(
            height: 30,
          ),
          const Center(
            child: Text('We Sent you an Email to reset your password.'),
          ),
          const SizedBox(
            height: 30,
          ),
          BasicAppButton(
              onPressed: () {
                context.go('/signin');
              },
              width: 200,
              title: 'Return to Login'),
        ],
      ),
    );
  }
}
