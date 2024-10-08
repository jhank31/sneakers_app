import 'package:e_commers_app/domain/usecases.dart';
import 'package:e_commers_app/presentation/home/bloc/user_info_display_state.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoLoading());

  void displayUserInfo() async {
    var returnedData = await sl<GetUserUsecase>().call();
    returnedData.fold(
      (error) {
        emit(LoadUserInfoFailure());
      },
      (data) {
        emit(UserInfoLoaded(
          userEntity: data,
        ));
      },
    );
  }
}
