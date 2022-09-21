import 'package:lesson_11/src/database/database_helper.dart';
import 'package:lesson_11/src/model/address_model.dart';
import 'package:rxdart/rxdart.dart';

class AddressBloc {
  final DatabaseHelper dbh = DatabaseHelper();

  final _fetchAddress = PublishSubject<List<AddressModel>>();

  Stream<List<AddressModel>> get getAddress => _fetchAddress.stream;

  allAddresses() async {
    List<AddressModel> list = await dbh.getAddresses();
    _fetchAddress.sink.add(list);
  }

  saveAddress(AddressModel data) async {
    await dbh.saveAddress(data);
    allAddresses();
  }

  deleteAddress(int id) async {
    await dbh.deleteAddress(id);
    allAddresses();
  }

  updateAddress(AddressModel data) async {
    await dbh.updateAddress(data);
    allAddresses();
  }
}
final addressBloc = AddressBloc();
