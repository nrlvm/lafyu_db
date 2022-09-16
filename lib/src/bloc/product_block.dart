import 'package:lesson_11/src/model/flash_sale_model.dart';
import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/model/product_detail_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class ProductBlock {
  final ApiProvider apiProvider = ApiProvider();

  final _fetchProductDetail = PublishSubject<ProductDetailModel>();
  final _fetchFlashSale = PublishSubject<FlashSaleModel>();

  Stream<ProductDetailModel> get getDetail => _fetchProductDetail.stream;

  Stream<FlashSaleModel> get getFlashSale => _fetchFlashSale.stream;

  allProductDetail(int id) async {
    HttpResult responseProductDetail = await apiProvider.getProductDetail(id);
    if (responseProductDetail.isSuccess) {
      ProductDetailModel productDetailData =
          ProductDetailModel.fromJson(responseProductDetail.result);
      _fetchProductDetail.sink.add(productDetailData);
    }
  }

  saveCard(ProductDetailModel data){
  }

  allFlashSale() async {
    HttpResult responseFlash = await apiProvider.getFlashSale();
    if (responseFlash.isSuccess) {
      FlashSaleModel flashSaleData = FlashSaleModel.fromJson(
        responseFlash.result,
      );
      _fetchFlashSale.sink.add(flashSaleData);
    }
  }
}

final productBlock = ProductBlock();
