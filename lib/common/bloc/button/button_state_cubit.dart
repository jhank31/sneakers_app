import 'package:dartz/dartz.dart';
import 'package:e_commers_app/common/bloc/button/button_state.dart';
import 'package:e_commers_app/core/usecase.dart/usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> excecute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecase.call(params: params);

      returnedData.fold(
          (error) => emit(ButtonFailureState(errorMessage: error)),
          (data) => emit(ButtonSuccessState()));
    } catch (e) {
      emit(ButtonFailureState(errorMessage: e.toString()));
    }
  }
}
