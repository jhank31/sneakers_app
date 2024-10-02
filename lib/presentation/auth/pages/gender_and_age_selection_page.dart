import 'package:e_commers_app/common/widgets/widgets.dart';
import 'package:e_commers_app/core/theme/app_colors.dart';
import 'package:e_commers_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:e_commers_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:e_commers_app/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:e_commers_app/presentation/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderAndAgeSelectionPage extends StatelessWidget {
  const GenderAndAgeSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => AgesDisplayCubit()),
        ],
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tell us about yourself',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
              child: Center(
                  child: BasicAppButton(
                onPressed: () {},
                title: 'Finish',
              )),
            )
          ],
        ),
      ),
    );
  }
}
