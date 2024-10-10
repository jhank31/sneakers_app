import 'package:e_commers_app/domain/usecases.dart';
import 'package:e_commers_app/presentation/home/bloc/loading_cubit.dart';
import 'package:e_commers_app/presentation/home/bloc/new_products/new_product_display_state.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewProductDisplayCubit extends Cubit<NewProductDisplayState> {
  final LoadingCubit loadingCubit;
  NewProductDisplayCubit(this.loadingCubit) : super(NewProductLoading());

  void displayProducts() async {
    try {
      loadingCubit.startLoading();
      var returnedData = await sl<GetNewInUsecase>().call();
      returnedData.fold(
        (error) {
          emit(LoadProductsFailure());
        },
        (data) {
          emit(NewProductLoaded(
            newProducts: data,
          ));
        },
      );
    } catch (e) {
      emit(LoadProductsFailure());
    } finally {
      loadingCubit.finishLoading();
    }
  }
}
