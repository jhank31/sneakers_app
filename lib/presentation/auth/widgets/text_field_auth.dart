import 'package:e_commers_app/presentation/auth/bloc/obscure_password_cubit.dart';
import 'package:flutter/material.dart';

class TextFieldAuth extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final ObscurePasswordCubit? obscureCubit;
  final GlobalKey<FormState>? formKey;
  const TextFieldAuth({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText,
    this.obscureCubit,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      onChanged: (value) {
        if (formKey!.currentState!.validate()) {
          formKey!.currentState!.save();
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: obscureText != null
            ? IconButton(
                icon: Icon(
                  obscureCubit!.state == false
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  obscureCubit!.changeObscure();
                },
              )
            : null,
      ),
      obscureText: obscureText ?? false,
    );
  }
}
