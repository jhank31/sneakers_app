import 'package:flutter_bloc/flutter_bloc.dart';

class ObscurePasswordCubit extends Cubit<bool> {
  ObscurePasswordCubit() : super(true);

  void changeObscure() {
    emit(!state);
  }
}
