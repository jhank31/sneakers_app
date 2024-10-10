import 'package:dartz/dartz.dart';
import 'package:e_commers_app/data/product/models/product_model.dart';
import 'package:e_commers_app/data/product/source/product_firebase_service.dart';
import 'package:e_commers_app/domain/product/repository/product_repository.dart';
import 'package:e_commers_app/service_locator.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<Either> getTopSelling() async {
    var products = await sl<ProductFirebaseService>().getTopSelling();
    return products.fold(
      (error) => Left(error),
      (data) {
        return Right(List.from(data)
            .map((e) => ProductModel.fromJson(e).toEntity())
            .toList());
      },
    );
  }

  @override
  Future<Either> getNewIn() async {
    var products = await sl<ProductFirebaseService>().getNewIn();
    return products.fold(
      (error) => Left(error),
      (data) {
        return Right(List.from(data)
            .map((e) => ProductModel.fromJson(e).toEntity())
            .toList());
      },
    );
  }
}
