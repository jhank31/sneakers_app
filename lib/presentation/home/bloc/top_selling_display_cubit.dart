import 'package:e_commers_app/domain/usecases.dart';
import 'package:e_commers_app/presentation/home/bloc/top_selling_display_state.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellingDisplayCubit  extends Cubit<TopSellingDisplayState> {
  TopSellingDisplayCubit() : super(TopSellingLoading());

  void displayTopSelling() async {
    var returnedData = await sl<GetTopSellings>().call();
    returnedData.fold(
      (error) {
        emit(LoadTopSellingFailure());
      },
      (data) {
        emit(TopSellingLoaded(
          topSellings: data,
        ));
      },
    );
  }

}