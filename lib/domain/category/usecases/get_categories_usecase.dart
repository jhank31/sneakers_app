import 'package:dartz/dartz.dart';
import 'package:e_commers_app/core/usecase.dart/usecase.dart';
import 'package:e_commers_app/domain/category/repository/category_repository.dart';
import 'package:e_commers_app/service_locator.dart';

class GetCategoriesUsecase  implements UseCase<Either, Null> {
  @override
  Future<Either> call({Null params}) async {
    return await sl<CategoryRepository>().getCategories();
  }

}