import 'package:lesson_11/src/model/category_model.dart';
import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class CategoryBlock {
  final ApiProvider _apiProvider = ApiProvider();

  final _fetchCategory = PublishSubject<CategoryModel>();

  Stream<CategoryModel> get getCategory => _fetchCategory.stream;

  allCategory() async {
    HttpResult responseCategory = await _apiProvider.getCategory();
    if (responseCategory.isSuccess) {
      CategoryModel categoryModel =
          CategoryModel.fromJson(responseCategory.result);
      _fetchCategory.sink.add(categoryModel);
    }
  }
}

final categoryBlock = CategoryBlock();
