import 'package:e_commers_app/common/helpers/auth/auth_validations/auth_validations_text_fields.dart';
import 'package:e_commers_app/common/widgets/widgets.dart';
import 'package:e_commers_app/core/theme/app_colors.dart';
import 'package:e_commers_app/data/auth/models/user_creation_req.dart';
import 'package:e_commers_app/presentation/auth/bloc/obscure_password_cubit.dart';
import 'package:e_commers_app/presentation/auth/bloc/password_validation_cubit.dart';
import 'package:e_commers_app/presentation/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        backgroundColor: AppColors.background,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => ObscurePasswordCubit(),
                ),
                BlocProvider(
                  create: (context) => PasswordValidationCubit(),
                ),
              ],
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
                      formKey: formKey,
                      validator: AuthValidationsTextFields.validateEmpty,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldAuth(
                        hintText: 'Last name',
                        controller: _lastName,
                        formKey: formKey,
                        validator: AuthValidationsTextFields.validateEmpty),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFieldAuth(
                      hintText: 'Email Address',
                      controller: _email,
                      formKey: formKey,
                      validator: AuthValidationsTextFields.validateEmail,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<ObscurePasswordCubit, bool>(
                      builder: (context, state) {
                        return TextFieldAuth(
                          hintText: 'Password',
                          controller: _password,
                          formKey: formKey,
                          obscureCubit: context.read<ObscurePasswordCubit>(),
                          obscureText: state,
                          validator: AuthValidationsTextFields.isValidPassword,
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BlocBuilder<PasswordValidationCubit, bool>(
                      builder: (context, state) {
                        return PwValidator(
                          controller: _password,
                          passwordValidationCubit:
                              context.read<PasswordValidationCubit>(),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BasicAppButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          context.push('/gender-and-age-selection',
                              extra: UserCreationReq(
                                firstName: _firstName.text,
                                lastName: _lastName.text,
                                email: _email.text,
                                password: _password.text,
                              ));
                        }
                      },
                      title: 'Continue',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
