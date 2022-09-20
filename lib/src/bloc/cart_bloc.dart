import 'package:lesson_11/src/bloc/favorite_bloc.dart';
import 'package:lesson_11/src/database/database_helper.dart';
import 'package:lesson_11/src/model/card_model.dart';
import 'package:lesson_11/src/model/favorite_model.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchCart = PublishSubject<List<CartModel>>();

  Stream<List<CartModel>> get getCart => _fetchCart.stream;

  allCart() async {
    List<CartModel> card = await dbh.getProducts();
    List<FavoriteModel> fav = await dbh.getFavorites();
    for (int i = 0; i < card.length; i++) {
      for (int j = 0; j < fav.length; j++) {
        if (card[i].id == fav[j].id) {
          card[i].isFavorite = true;
          break;
        }
      }
    }
    _fetchCart.sink.add(card);
  }

  updateCart(CartModel data) async {
    await dbh.updateProduct(data);
    allCart();
  }

  deleteProduct(int id) async {
    await dbh.deleteProduct(id);
  }

  saveFavorite(CartModel data) async {
    FavoriteModel favoriteModel = FavoriteModel(
      id: data.id,
      starCount: data.starCount,
      price: data.price,
      title: data.title,
      image: data.image,
    );
    await dbh.saveFavorite(favoriteModel);
    allCart();
  }

  deleteFavorite(int id) async {
    await dbh.deleteFavorite(id);
    allCart();
  }
}

final cartBloc = CartBloc();
