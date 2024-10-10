import 'package:e_commers_app/domain/product/entities/product_entity.dart';

abstract class NewProductDisplayState {}

class NewProductLoading extends NewProductDisplayState {}

class NewProductLoaded extends NewProductDisplayState {
  final List<ProductEntity> newProducts;

  NewProductLoaded({required this.newProducts});
}

class LoadProductsFailure extends NewProductDisplayState {}
