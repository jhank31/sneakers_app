

import 'package:e_commers_app/domain/product/entities/product_entity.dart';

abstract class TopSellingProductDisplayState {}

class TopSellingProductLoading extends TopSellingProductDisplayState {}

class TopSellingProductLoaded extends TopSellingProductDisplayState {
  final List<ProductEntity> topSellings;

  TopSellingProductLoaded({required this.topSellings});
}

class LoadTopSellingProductsFailure extends TopSellingProductDisplayState {}
