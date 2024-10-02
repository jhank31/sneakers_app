import 'package:e_commers_app/common/helpers/size_screen/size_screen.dart';
import 'package:e_commers_app/presentation/auth/bloc/ages_display_cubit.dart';
import 'package:e_commers_app/presentation/auth/bloc/ages_display_state.dart';
import 'package:e_commers_app/presentation/auth/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgesBottomSheet extends StatelessWidget {
  const AgesBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight(hisVar: 0.34),
      child: BlocBuilder<AgesDisplayCubit, AgesDisplayState>(
        builder: (context, state) {
          if (state is AgesLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is AgesLoaded) {
            return AgesBuilder(ages: state.ages);
          }

          if (state is AgesLoadFailure) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
