import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/model/super_flash_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class OfferBloc {
  final ApiProvider _apiProvider = ApiProvider();

  final _fetchOffer = PublishSubject<SuperFlashModel>();

  Stream<SuperFlashModel> get getOffers => _fetchOffer.stream;

  allOffers() async {
    HttpResult responseOffers = await _apiProvider.getSuperFlash();
    if (responseOffers.isSuccess) {
      SuperFlashModel superFlashModel =
          SuperFlashModel.fromJson(responseOffers.result);
      _fetchOffer.sink.add(superFlashModel);
    }
  }
}

final offerBloc = OfferBloc();
