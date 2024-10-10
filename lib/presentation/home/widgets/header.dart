import 'package:e_commers_app/core/configs/assets/app_images.dart';
import 'package:e_commers_app/core/theme/app_colors.dart';
import 'package:e_commers_app/domain/auth/entities/user_entity.dart';
import 'package:e_commers_app/presentation/home/bloc/user_info/user_info_display_cubit.dart';
import 'package:e_commers_app/presentation/home/bloc/user_info/user_info_display_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
      builder: (context, state) {
        if (state is UserInfoLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageProfile(
                userEntity: state.userEntity,
              ),
              Gender(
                userEntity: state.userEntity,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          );
        } else if (state is LoadUserInfoFailure) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class Gender extends StatelessWidget {
  final UserEntity userEntity;
  const Gender({
    super.key,
    required this.userEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.secondBackground,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        userEntity.gender == 1 ? 'Man' : 'Woman',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class ImageProfile extends StatelessWidget {
  final UserEntity userEntity;
  const ImageProfile({
    super.key,
    required this.userEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: userEntity.image.isEmpty
                ? const AssetImage(AppImages.profileImage)
                : NetworkImage(userEntity.image)),
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}
