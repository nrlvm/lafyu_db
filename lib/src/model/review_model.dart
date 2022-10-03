import 'package:lesson_11/src/model/product_detail_model.dart';

class ReviewListModel {
  ReviewListModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<Review> results;

  factory ReviewListModel.fromJson(Map<String, dynamic> json) => ReviewListModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? '',
        previous: json["previous"] ?? '',
        results: json["results"] == null
            ? <Review>[]
            : List<Review>.from(
                json["results"].map((x) => Review.fromJson(x))),
      );
}

