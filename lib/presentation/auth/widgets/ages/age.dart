import 'package:e_commers_app/common/helpers/bottom_sheet/app_bottom_sheet.dart';
import 'package:e_commers_app/core/theme/app_colors.dart';
import 'package:e_commers_app/presentation/auth/bloc/age_selection_cubit.dart';
import 'package:e_commers_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:e_commers_app/presentation/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Age extends StatelessWidget {
  const Age({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgeSelectionCubit, String>(builder: (context, state) {
      return GestureDetector(
        onTap: () {
          AppBottomSheet.display(
              context,
              MultiBlocProvider(providers: [
                BlocProvider.value(value: context.read<AgeSelectionCubit>()),
                BlocProvider.value(
                    value: context.read<AgesDisplayCubit>()..displayAges()),
              ], child: const AgesBottomSheet()));
        },
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: AppColors.secondBackground,
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(state), const Icon(Icons.keyboard_arrow_down)],
          ),
        ),
      );
    });
  }
}
