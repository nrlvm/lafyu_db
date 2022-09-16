import 'package:lesson_11/src/model/category_model.dart';
import 'package:lesson_11/src/model/flash_sale_model.dart';
import 'package:lesson_11/src/model/super_flash_model.dart';

class HomeModel {
  SuperFlashModel superFlashModel;
  CategoryModel categoryModel;
  FlashSaleModel flashSaleModel;
  FlashSaleModel megaSaleModel;
  FlashSaleModel homeSaleModel;

  HomeModel({
    required this.superFlashModel,
    required this.categoryModel,
    required this.flashSaleModel,
    required this.megaSaleModel,
    required this.homeSaleModel,
  });
}
