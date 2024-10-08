import 'package:dartz/dartz.dart';
import 'package:e_commers_app/core/usecase.dart/usecase.dart';
import 'package:e_commers_app/domain/product/repository/product_repository.dart';
import 'package:e_commers_app/service_locator.dart';

class GetTopSellings implements UseCase<Either, Null> {
  @override
  Future<Either> call({Null params}) async {
    return await sl<ProductRepository>().getTopSelling();
  }
}
