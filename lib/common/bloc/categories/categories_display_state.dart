import 'package:e_commers_app/domain/category/entities/category_entity.dart';

abstract class CategoriesDisplayState {}

class CategoriesDisplayLoading extends CategoriesDisplayState {}

class CategoriesDisplayLoaded extends CategoriesDisplayState {
  final List<CategoryEntity> categories;
  CategoriesDisplayLoaded({required this.categories});
}

class LoadCategoryFailure extends CategoriesDisplayState {}
