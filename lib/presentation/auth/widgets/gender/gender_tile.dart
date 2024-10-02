import 'package:e_commers_app/core/theme/app_colors.dart';
import 'package:e_commers_app/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GenderTile extends StatelessWidget {
  final BuildContext fatherContext;
  final int genderIndex;
  final String gender;

  const GenderTile(
      {super.key,
      required this.genderIndex,
      required this.gender,
      required this.fatherContext});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: GestureDetector(
        onTap: () {
          fatherContext.read<GenderSelectionCubit>().selectGender(genderIndex);
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: fatherContext.read<GenderSelectionCubit>().selectedIndex ==
                      genderIndex
                  ? AppColors.primary
                  : AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(
              gender,
              style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
