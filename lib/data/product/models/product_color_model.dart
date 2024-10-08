import 'package:e_commers_app/domain/product/entities/product_color_entity.dart';

class ProductColorModel {
  final String title;
  final String hexCode;

  ProductColorModel({
    required this.title,
    required this.hexCode,
  });

  factory ProductColorModel.fromJson(Map<String, dynamic> json) {
    return ProductColorModel(
      title: json['title'],
      hexCode: json['hexCode'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'hexCode': hexCode,
    };
  }
}

extension ProductColorXModel on ProductColorModel {
  ProductColorEntity toEntity() {
    return ProductColorEntity(
      title: title,
      hexCode: hexCode,
    );
  }
}

extension ProductColorXEntity on ProductColorEntity {
  ProductColorModel fromEntity() {
    return ProductColorModel(
      title: title,
      hexCode: hexCode,
    );
  }
}
