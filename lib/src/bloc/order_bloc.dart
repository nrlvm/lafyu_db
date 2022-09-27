import 'package:lesson_11/src/model/get_orders_model.dart';
import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class OrderBloc {
  final ApiProvider _apiProvider = ApiProvider();

  final _fetchOrder = PublishSubject<GetOrderModel>();

  Stream<GetOrderModel> get getOrders => _fetchOrder.stream;

  allOrders() async {
    HttpResult responseOrders = await _apiProvider.getOrders();
    if (responseOrders.isSuccess) {
      GetOrderModel data = GetOrderModel.fromJson(responseOrders.result);
      _fetchOrder.sink.add(data);
    }
  }
}

final orderBloc = OrderBloc();
