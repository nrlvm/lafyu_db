import 'package:lesson_11/src/bloc/cart_bloc.dart';
import 'package:lesson_11/src/bloc/favorite_bloc.dart';
import 'package:lesson_11/src/database/database_helper.dart';
import 'package:lesson_11/src/model/card_model.dart';
import 'package:lesson_11/src/model/favorite_model.dart';
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
      List<FavoriteModel> fav = await dbh.getFavorite(productDetailData.id);
      if (card.isNotEmpty) {
        productDetailData.cardCount = card.first.cardCount;
      }
      if (fav.isNotEmpty) {
        productDetailData.isFavorite = true;
      }
      _fetchProductDetail.sink.add(productDetailData);
    }
  }

  saveFavorite(ProductDetailModel data) async {
    FavoriteModel favoriteModel = FavoriteModel(
      id: data.id,
      starCount: data.reviewAvg,
      price: data.price,
      title: data.name,
      image: data.images.isNotEmpty ? data.images.first.image : '',
    );
    await dbh.saveFavorite(favoriteModel);
    data.isFavorite = true;
    _fetchProductDetail.sink.add(data);
    cartBloc.allCart();
    favoriteBloc.allFavorite();
  }

  deleteFavorite(ProductDetailModel data) async {
    data.isFavorite = false;
    await dbh.deleteFavorite(data.id);
    _fetchProductDetail.sink.add(data);
    cartBloc.allCart();
    favoriteBloc.allFavorite();
  }

  saveCart(ProductDetailModel data) async {
    CartModel cardModel = CartModel(
      id: data.id,
      title: data.name,
      image: data.images.isNotEmpty ? data.images.first.image : '',
      price: data.price,
      cardCount: 1,
      starCount: data.reviewAvg,
    );
    data.cardCount = 1;
    await dbh.saveProduct(cardModel);
    _fetchProductDetail.sink.add(data);
    cartBloc.allCart();
    favoriteBloc.allFavorite();
  }

  updateCart(ProductDetailModel data) async {
    CartModel cardModel = CartModel(
      id: data.id,
      title: data.name,
      image: data.images.isNotEmpty ? data.images.first.image : '',
      price: data.price,
      cardCount: data.cardCount,
      starCount: data.reviewAvg,
    );
    await dbh.updateProduct(cardModel);
    _fetchProductDetail.sink.add(data);
    cartBloc.allCart();
  }

  deleteCart(ProductDetailModel data) async {
    data.cardCount = 0;
    await dbh.deleteProduct(data.id);
    _fetchProductDetail.sink.add(data);
    cartBloc.allCart();
  }
}

final productBlock = ProductBlock();
