import 'package:e_commers_app/common/helpers/size_screen/size_screen.dart';
import 'package:e_commers_app/common/widgets/widgets.dart';
import 'package:e_commers_app/presentation/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SinginPage extends StatelessWidget {
  SinginPage({super.key});

  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: context.screenHeight(hisVar: 0.15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleTextAuth(
              title: 'Sign In',
            ),
            const SizedBox(
              height: 20,
            ),
            TextFieldAuth(
              hintText: 'Email Address',
              controller: _email,
            ),
            const SizedBox(
              height: 20,
            ),
            BasicAppButton(
              onPressed: () {},
              title: 'Continue',
            ),
            const SizedBox(
              height: 20,
            ),
            const CreateAccountTextButton(),
          ],
        ),
      ),
    );
  }
}
