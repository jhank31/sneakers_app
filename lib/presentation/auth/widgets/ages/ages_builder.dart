import 'package:e_commers_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AgesBuilder extends StatelessWidget {
  final List<String> ages;
  const AgesBuilder({super.key, required this.ages});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.pop();
              context
                  .read<AgeSelectionCubit>()
                  .selectAge(ages[index]);
            },
            child: Text(
              ages[index],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 20,
            ),
        itemCount: ages.length);
  }
}
