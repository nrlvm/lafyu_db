import 'package:lesson_11/src/model/category_model.dart';
import 'package:lesson_11/src/model/flash_sale_model.dart';
import 'package:lesson_11/src/model/home_model.dart';
import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/model/super_flash_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class HomeBlock {
  final ApiProvider _apiProvider = ApiProvider();

  final _fetchHome = PublishSubject<HomeModel>();
  final _fetchSuperFlashById = PublishSubject<HomeModel>();

  Stream<HomeModel> get getHome => _fetchHome.stream;

  Stream<HomeModel> get getSuperFlash => _fetchSuperFlashById.stream;

  allHomeData() async {
    HomeModel homeModel = HomeModel(
      homeSaleModel: FlashSaleModel.fromJson({}),
      superFlashModel: SuperFlashModel.fromJson({}),
      categoryModel: CategoryModel.fromJson({}),
      flashSaleModel: FlashSaleModel.fromJson({}),
      megaSaleModel: FlashSaleModel.fromJson({}),
    );
    HttpResult responseSuper = await _apiProvider.getSuperFlash();
    if (responseSuper.isSuccess) {
      SuperFlashModel superFlashData = SuperFlashModel.fromJson(
        responseSuper.result,
      );
      homeModel.superFlashModel = superFlashData;
      _fetchHome.sink.add(homeModel);
    }

    HttpResult responseCategory = await _apiProvider.getCategory();
    if (responseCategory.isSuccess) {
      CategoryModel categoryModel =
          CategoryModel.fromJson(responseCategory.result);
      homeModel.categoryModel = categoryModel;
      _fetchHome.sink.add(homeModel);
    }

    HttpResult responseFlash = await _apiProvider.getFlashSale();
    if (responseFlash.isSuccess) {
      FlashSaleModel flashSaleData = FlashSaleModel.fromJson(
        responseFlash.result,
      );
      homeModel.flashSaleModel = flashSaleData;
      _fetchHome.sink.add(homeModel);
    }

    HttpResult responseMegaSale = await _apiProvider.getMegaSale();
    if (responseMegaSale.isSuccess) {
      FlashSaleModel megaSaleData = FlashSaleModel.fromJson(
        responseMegaSale.result,
      );
      homeModel.megaSaleModel = megaSaleData;
      _fetchHome.sink.add(homeModel);
    }

    HttpResult responseHomeSale = await _apiProvider.getHomeSale();
    if (responseHomeSale.isSuccess) {
      FlashSaleModel homeSaleData = FlashSaleModel.fromJson(
        responseHomeSale.result,
      );
      homeModel.homeSaleModel = homeSaleData;
      _fetchHome.sink.add(homeModel);
    }
  }

  allSuperFlashById(int id) async {
    HttpResult responseSuperById = await _apiProvider.getSuperFlashById(id);
    if (responseSuperById.isSuccess) {
      SuperFlashModel superFlashIdData = SuperFlashModel.fromJson(
        responseSuperById.result,
      );
      allSuperFlashById(id).superFlashModelById = superFlashIdData;
      _fetchSuperFlashById.sink.add(
        allSuperFlashById(id),
      );
    }
  }
}

final homeBlock = HomeBlock();
