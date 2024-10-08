import 'package:e_commers_app/core/constant/app_url.dart';

class ImagesDisplayHelper {
  static String generateCategoryImageURL(String title) {
    return AppUrl.categoryImage + title + AppUrl.alt;
  }

  static String generateProductImageURL(String title) {
    return AppUrl.productImage + title + AppUrl.alt;
  }
}
