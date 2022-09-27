import 'package:lesson_11/src/model/category_model.dart';
import 'package:lesson_11/src/model/flash_sale_model.dart';
import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBlock {
  final ApiProvider _apiProvider = ApiProvider();

  final _fetchCategory = PublishSubject<CategoryModel>();
  final _fetchCatProducts = PublishSubject<FlashSaleModel>();

  Stream<FlashSaleModel> get getCatProducts => _fetchCatProducts.stream;

  Stream<CategoryModel> get getCategory => _fetchCategory.stream;

  allCategory() async {
    HttpResult responseCategory = await _apiProvider.getCategory();
    if (responseCategory.isSuccess) {
      CategoryModel categoryModel =
          CategoryModel.fromJson(responseCategory.result);
      _fetchCategory.sink.add(categoryModel);
    }
  }

  productsByCategoryId(int id) async {
    HttpResult responseProduct = await _apiProvider.getCategoryProducts(id);
    if (responseProduct.isSuccess) {
      FlashSaleModel flashSaleModel =
          FlashSaleModel.fromJson(responseProduct.result);
      _fetchCatProducts.sink.add(flashSaleModel);
    }
  }
}

final categoryBlock = CategoryBlock();
