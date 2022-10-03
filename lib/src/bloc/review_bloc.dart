import 'package:lesson_11/src/model/http_result.dart';
import 'package:lesson_11/src/model/review_model.dart';
import 'package:lesson_11/src/provider/api_provider.dart';
import 'package:rxdart/rxdart.dart';

class ReviewBloc {
  final ApiProvider _apiProvider = ApiProvider();

  final _fetchReviews = PublishSubject<ReviewListModel>();

  Stream<ReviewListModel> get getReviews => _fetchReviews.stream;

  allReviews(int id) async {
    HttpResult responseReviews = await _apiProvider.getReviews(id);
    if (responseReviews.isSuccess) {
      ReviewListModel reviewModel =
          ReviewListModel.fromJson(responseReviews.result);
      _fetchReviews.sink.add(reviewModel);
    }
  }

  Future<HttpResult> saveReview(
    int productId,
    int starCount,
    String text,
  ) {
    return _apiProvider.postReview(
      productId,
      starCount,
      text,
    );
  }
}

final reviewBloc = ReviewBloc();
