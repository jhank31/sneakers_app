import 'package:e_commers_app/domain/auth/entities/user_entity.dart';

abstract class UserInfoDisplayState {}

class UserInfoLoaded extends UserInfoDisplayState {
  final UserEntity userEntity;
  UserInfoLoaded({required this.userEntity});
}
class UserInfoLoading extends UserInfoDisplayState {}
class LoadUserInfoFailure extends UserInfoDisplayState {}

