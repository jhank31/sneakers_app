import 'package:e_commers_app/domain/usecases.dart';
import 'package:e_commers_app/presentation/auth/bloc/ages_display_state.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AgesDisplayCubit extends Cubit<AgesDisplayState> {
  AgesDisplayCubit() : super(AgesLoading());

  Future<void> displayAges() async {
    var returnedData = await sl<GetAgesUsecase>().call();

    return returnedData.fold((message) {
      emit(
        AgesLoadFailure(message: message),
      );
    }, (data) {
      emit(
        AgesLoaded(ages: data),
      );
    });
  }
}
