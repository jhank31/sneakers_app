import 'package:e_commers_app/common/helpers/size_screen/size_screen.dart';
import 'package:e_commers_app/presentation/auth/bloc/password_validation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

class PwValidator extends StatelessWidget {
  final TextEditingController controller;
  final PasswordValidationCubit passwordValidationCubit;
  const PwValidator({
    super.key,
    required this.controller,
    required this.passwordValidationCubit,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterPwValidator(
      defaultColor: Colors.grey,
      successColor: Colors.green,
      failureColor: Colors.grey,
      uppercaseCharCount: 1,
      lowercaseCharCount: 1,
      numericCharCount: 1,
      normalCharCount: 1,
      specialCharCount: 1,
      width: context.screenWidth(),
      height: 220,
      minLength: 8,
      onSuccess: () {
        passwordValidationCubit.validatePassword(true);
      },
      onFail: () {
        passwordValidationCubit.validatePassword(false);
      },
      controller: controller,
    );
  }
}
