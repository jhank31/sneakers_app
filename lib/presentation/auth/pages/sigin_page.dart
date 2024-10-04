import 'package:e_commers_app/common/bloc/button/button_state.dart';
import 'package:e_commers_app/common/bloc/button/button_state_cubit.dart';
import 'package:e_commers_app/common/helpers/auth/auth_validations/auth_validations_text_fields.dart';
import 'package:e_commers_app/common/helpers/size_screen/size_screen.dart';
import 'package:e_commers_app/common/widgets/widgets.dart';
import 'package:e_commers_app/data/auth/models/user_signin_req.dart';
import 'package:e_commers_app/domain/auth/usecases_auth.dart';
import 'package:e_commers_app/presentation/auth/bloc/obscure_password_cubit.dart';
import 'package:e_commers_app/presentation/auth/widgets/widgets.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SinginPage extends StatelessWidget {
  SinginPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => ObscurePasswordCubit()),
            BlocProvider(create: (context) => ButtonStateCubit()),
          ],
          child: BlocListener<ButtonStateCubit, ButtonState>(
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
                context.go('/home');
              }
            },
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: context.screenHeight(hisVar: 0.15),
                ),
                child: Form(
                  key: formKey,
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
                        formKey: formKey,
                        validator: AuthValidationsTextFields.validateEmpty,
                        controller: _email,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<ObscurePasswordCubit, bool>(
                        builder: (context, state) {
                          return TextFieldAuth(
                            hintText: 'Password',
                            formKey: formKey,
                            validator: AuthValidationsTextFields.validateEmpty,
                            controller: _password,
                            obscureCubit: context.read<ObscurePasswordCubit>(),
                            obscureText: state,
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const ForgotPasswordButton(),
                      SizedBox(
                        height: 100,
                        child: Center(child: Builder(builder: (context) {
                          return BasicReactiveAppButton(
                            width: context.screenWidth(),
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState!.validate()) {
                                var userSigninReq = UserSigninReq(
                                  email: _email.text,
                                  password: _password.text,
                                );
                                context.read<ButtonStateCubit>().excecute(
                                    usecase: sl<SinginUsecase>(),
                                    params: userSigninReq);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  FailureSnackbar.getSnackBar(
                                    context,
                                    'Please fill all fields',
                                  ),
                                );
                              }
                            },
                            title: 'Continue',
                          );
                        })),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const CreateAccountTextButton(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
