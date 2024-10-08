import 'package:e_commers_app/domain/product/entities/product_entity.dart';

abstract class TopSellingDisplayState {}

class TopSellingLoading extends TopSellingDisplayState {}

class TopSellingLoaded extends TopSellingDisplayState {
  final List<ProductEntity> topSellings;

  TopSellingLoaded({required this.topSellings});
}

class LoadTopSellingFailure extends TopSellingDisplayState {}