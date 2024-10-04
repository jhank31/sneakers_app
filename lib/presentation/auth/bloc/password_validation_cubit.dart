import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordValidationCubit extends Cubit<bool> {
  PasswordValidationCubit() : super(false);

  void validatePassword(bool isValid) {
    if (isValid) {
      emit(true);
    } else {
      emit(false);
    }
  }
}
