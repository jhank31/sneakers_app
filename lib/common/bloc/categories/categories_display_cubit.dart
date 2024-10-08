import 'package:e_commers_app/common/bloc/categories/categories_display_state.dart';
import 'package:e_commers_app/domain/usecases.dart';
import 'package:e_commers_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesDisplayLoading());
  void displayCategories() async {
    var returnedData = await sl<GetCategoriesUsecase>().call();
    returnedData.fold(
      (error) => emit(LoadCategoryFailure()),
      (data) => emit(CategoriesDisplayLoaded(categories: data)),
    );
  }
}
