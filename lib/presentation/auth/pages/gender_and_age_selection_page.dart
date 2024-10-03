import 'package:e_commers_app/common/bloc/button/button_state.dart';
import 'package:e_commers_app/common/bloc/button/button_state_cubit.dart';
import 'package:e_commers_app/common/widgets/widgets.dart';
import 'package:e_commers_app/core/theme/app_colors.dart';
import 'package:e_commers_app/data/auth/models/user_creation_req.dart';
import 'package:e_commers_app/domain/auth/usecases_auth.dart';
import 'package:e_commers_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:e_commers_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:e_commers_app/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:e_commers_app/presentation/auth/widgets/widgets.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  final UserCreationReq userCreationReq;
  const GenderAndAgeSelectionPage({
    super.key,
    required this.userCreationReq,
  });

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const BasicAppbar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
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
          //? is a way to use a spacer inside any scrolls
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tell us about yourself',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Gender(),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'How old are you?',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Age(),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 100,
                      color: AppColors.secondBackground,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Center(child: Builder(builder: (context) {
                        return BasicReactiveAppButton(
                          onPressed: () {
                            userCreationReq.age =
                                context.read<AgeSelectionCubit>().state;
                            userCreationReq.gender =
                                context.read<GenderSelectionCubit>().state;
                            context.read<ButtonStateCubit>().excecute(
                                usecase: sl<SignupUsecase>(),
                                params: userCreationReq);
                          },
                          title: 'Finish',
                        );
                      })),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
