import 'package:e_commers_app/common/bloc/categories/categories_display_state.dart';
import 'package:e_commers_app/domain/usecases.dart';
import 'package:e_commers_app/presentation/home/bloc/loading_cubit.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  final LoadingCubit loadingCubit;
  CategoriesDisplayCubit(this.loadingCubit) : super(CategoriesDisplayLoading());
  void displayCategories() async {
    try {
      loadingCubit.startLoading();
      var returnedData = await sl<GetCategoriesUsecase>().call();
      returnedData.fold(
        (error) => emit(LoadCategoryFailure()),
        (data) => emit(CategoriesDisplayLoaded(categories: data)),
      );
    } catch (e) {
      emit(LoadCategoryFailure());
    } finally {
      loadingCubit.finishLoading();
    }
  }
}
