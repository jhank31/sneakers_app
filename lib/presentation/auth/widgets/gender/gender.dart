import 'package:e_commers_app/presentation/auth/bloc/gender_selection_cubit.dart';
import 'package:e_commers_app/presentation/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Gender extends StatelessWidget {
  const Gender({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(builder: (context, state) {
      return  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GenderTile(
            genderIndex: 1,
            gender: 'Man', fatherContext: context,
          ),
          const SizedBox(
            width: 20,
          ),
          GenderTile(
            genderIndex: 2,
            gender: 'Woman', fatherContext: context,
          ),
        ],
      );
    });
  }
}
