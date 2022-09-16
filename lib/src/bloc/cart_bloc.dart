import 'package:lesson_11/src/database/database_helper.dart';
import 'package:lesson_11/src/model/card_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchCart = PublishSubject<List<CartModel>>();

  Stream<List<CartModel>> get getCart => _fetchCart.stream;

  allCart() async {
    List<CartModel> list = await dbh.getProducts();
    _fetchCart.sink.add(list);
  }
}

final cartBloc = CartBloc();
