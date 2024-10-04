import 'package:e_commers_app/common/bloc/button/button_state.dart';
import 'package:e_commers_app/common/bloc/button/button_state_cubit.dart';
import 'package:e_commers_app/common/helpers/auth/auth_validations/auth_validations_text_fields.dart';
import 'package:e_commers_app/common/helpers/size_screen/size_screen.dart';
import 'package:e_commers_app/common/widgets/widgets.dart';
import 'package:e_commers_app/domain/auth/usecases_auth.dart';
import 'package:e_commers_app/presentation/auth/widgets/widgets.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({super.key});
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormState>? formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) => ButtonStateCubit(),
        child: BlocBuilder<ButtonStateCubit, ButtonState>(
          builder: (context, state) {
            return BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) async {
                if (state is ButtonFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    FailureSnackbar.getSnackBar(
                      context,
                      state.errorMessage,
                    ),
                  );
                }
                if (state is ButtonSuccessState) {
                  await Future.delayed(const Duration(milliseconds: 1500));
                  // ignore: use_build_context_synchronously
                  context.go('/password-reset-email');
                }
              },
              child: Padding(
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
                    Form(
                      key: formKey,
                      child: TextFieldAuth(
                        hintText: 'Enter Email Address',
                        controller: _email,
                        formKey: formKey,
                        validator: AuthValidationsTextFields.validateEmail,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BasicReactiveAppButton(
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (formKey!.currentState!.validate()) {
                          context.read<ButtonStateCubit>().excecute(
                              usecase: sl<SendPasswordResetEmaiUsecase>(),
                              params: _email.text);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            FailureSnackbar.getSnackBar(
                              context,
                              'Please fill email field',
                            ),
                          );
                        }
                      },
                      title: 'Continue',
                      width: context.screenWidth(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
