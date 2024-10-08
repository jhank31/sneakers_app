import 'package:e_commers_app/domain/category/entities/category_entity.dart';

class CategoryModel {
  final String image;
  final String title;
  final String idCategory;

  CategoryModel({
    required this.image,
    required this.title,
    required this.idCategory,
  });
  
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      image: json['image'] ?? '',
      title: json['title'] as String, 
      idCategory: json['idCategory'] as String,
    );
  }
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      idCategory: idCategory,
      title: title,
      image: image,
    );
  }
}
