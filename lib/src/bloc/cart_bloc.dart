import 'package:lesson_11/src/database/database_helper.dart';
import 'package:lesson_11/src/model/card_model.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchCart = PublishSubject<List<CartModel>>();

  Stream<List<CartModel>> get getCart => _fetchCart.stream;

  allCart() async {
    List<CartModel> list = await dbh.getProducts();
    _fetchCart.sink.add(list);
  }

  updateCart(List<CartModel> data, int index) async {
    await dbh.updateProduct(data[index]);
    _fetchCart.sink.add(data);
  }

  deleteProduct(List<CartModel> data, int index) async {
    await dbh.deleteProduct(data[index].id);
    data[index].cardCount = 0;
    _fetchCart.sink.add(data);
  }
}

final cartBloc = CartBloc();
