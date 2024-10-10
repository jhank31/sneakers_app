import 'package:e_commers_app/domain/usecases.dart';
import 'package:e_commers_app/presentation/home/bloc/loading_cubit.dart';
import 'package:e_commers_app/presentation/home/bloc/top_sellings/top_selling_product_display_state.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopSellingProductDisplayCubit
    extends Cubit<TopSellingProductDisplayState> {
  final LoadingCubit loadingCubit;
  TopSellingProductDisplayCubit(this.loadingCubit)
      : super(TopSellingProductLoading());

  void displayProducts() async {
    try {
      var returnedData = await sl<GetTopSellingsUsecase>().call();
      returnedData.fold(
        (error) {
          emit(LoadTopSellingProductsFailure());
        },
        (data) {
          emit(TopSellingProductLoaded(
            topSellings: data,
          ));
        },
      );
    } catch (e) {
      emit(LoadTopSellingProductsFailure());
    } finally {
      loadingCubit.finishLoading();
    }
  }
}
