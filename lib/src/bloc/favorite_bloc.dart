import 'package:lesson_11/src/database/database_helper.dart';
import 'package:lesson_11/src/model/favorite_model.dart';
import 'package:rxdart/rxdart.dart';

class FavoriteBloc{
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchFavorite = PublishSubject<List<FavoriteModel>>();

  Stream<List<FavoriteModel>> get getFavorite => _fetchFavorite.stream;

  allFavorite() async {
    List<FavoriteModel> list = await dbh.getFavorites();
    _fetchFavorite.sink.add(list);
  }

  saveFavorite(List<FavoriteModel> data, int index) async {
    await dbh.saveFavorite(data[index]);
    _fetchFavorite.sink.add(data);
  }

  deleteFavorite(List<FavoriteModel> data, int index)async{
    await dbh.deleteFavorite(data[index].id);
    _fetchFavorite.sink.add(data);
  }
}

final favoriteBloc = FavoriteBloc();