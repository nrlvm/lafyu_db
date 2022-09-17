import 'package:lesson_11/src/bloc/cart_bloc.dart';
import 'package:lesson_11/src/database/database_helper.dart';
import 'package:lesson_11/src/model/card_model.dart';
import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/model/product_detail_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class ProductBlock {
  final ApiProvider apiProvider = ApiProvider();
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchProductDetail = PublishSubject<ProductDetailModel>();

  Stream<ProductDetailModel> get getDetail => _fetchProductDetail.stream;

  allProductDetail(int id) async {
    HttpResult responseProductDetail = await apiProvider.getProductDetail(id);
    if (responseProductDetail.isSuccess) {
      ProductDetailModel productDetailData =
          ProductDetailModel.fromJson(responseProductDetail.result);

      List<CartModel> card = await dbh.getProduct(productDetailData.id);
      if (card.isNotEmpty) {
        productDetailData.cardCount = card.first.cardCount;
      }
      _fetchProductDetail.sink.add(productDetailData);
    }
  }

  saveCart(ProductDetailModel data) async {
    CartModel cardModel = CartModel(
      id: data.id,
      title: data.name,
      image: data.images.isNotEmpty ? data.images.first.image : '',
      price: data.price,
      cardCount: 1,
    );
    data.cardCount = 1;
    await dbh.saveProduct(cardModel);
    _fetchProductDetail.sink.add(data);
    cartBloc.allCart();
  }

  updateCart(ProductDetailModel data) async {
    CartModel cardModel = CartModel(
      id: data.id,
      title: data.name,
      image: data.images.isNotEmpty ? data.images.first.image : '',
      price: data.price,
      cardCount: data.cardCount,
    );
    await dbh.updateProduct(cardModel);
    _fetchProductDetail.sink.add(data);
    cartBloc.allCart();
  }

  deleteProduct(ProductDetailModel data) async {
    await dbh.deleteProduct(data.id);
    data.cardCount = 0;
    _fetchProductDetail.sink.add(data);
    cartBloc.allCart();
  }
}

final productBlock = ProductBlock();
