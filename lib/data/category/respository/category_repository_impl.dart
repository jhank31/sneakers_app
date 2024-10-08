import 'package:dartz/dartz.dart';
import 'package:e_commers_app/data/category/models/category_model.dart';
import 'package:e_commers_app/data/category/source/category_firebase_service.dart';
import 'package:e_commers_app/domain/category/repository/category_repository.dart';
import 'package:e_commers_app/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var returnedData = await sl<CategoryFirebaseService>().getCategories();

    return returnedData.fold(
      (error) => Left(error),
      (data) {
        return Right(
          List.from(data)
              .map((e) => CategoryModel.fromJson(e).toEntity())
              .toList(),
        );
      },
    );
  }
}
