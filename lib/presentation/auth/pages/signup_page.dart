import 'package:e_commers_app/common/widgets/widgets.dart';
import 'package:e_commers_app/core/theme/app_colors.dart';
import 'package:e_commers_app/data/auth/models/user_creation_req.dart';
import 'package:e_commers_app/presentation/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final Key formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        backgroundColor: AppColors.background,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TitleTextAuth(
                  title: 'Create Account',
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldAuth(
                  hintText: 'First name',
                  controller: _firstName,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldAuth(
                  hintText: 'Last name',
                  controller: _lastName,
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
                TextFieldAuth(
                  hintText: 'Password',
                  controller: _password,
                ),
                const SizedBox(
                  height: 20,
                ),
                BasicAppButton(
                  onPressed: () async {
                    context.push('/gender-and-age-selection',
                        extra: UserCreationReq(
                          firstName: _firstName.text,
                          lastName: _lastName.text,
                          email: _email.text,
                          password: _password.text,
                        ));
                  },
                  title: 'Continue',
                ),
                const SizedBox(
                  height: 20,
                ),
                const ForgotPasswordButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
