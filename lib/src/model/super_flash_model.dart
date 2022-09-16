
import 'package:lesson_11/src/model/flash_sale_model.dart';

class SuperFlashModel {
  SuperFlashModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  String previous;
  List<SuperFlashModelResult> results;

  factory SuperFlashModel.fromJson(Map<String, dynamic> json) =>
      SuperFlashModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? "",
        previous: json["previous"] ?? "",
        results: json["results"] == null
            ? <SuperFlashModelResult>[]
            : List<SuperFlashModelResult>.from(
                json["results"].map((x) => SuperFlashModelResult.fromJson(x))),
      );
}

class SuperFlashModelResult {
  SuperFlashModelResult({
    required this.id,
    required this.endDate,
    required this.image,
    required this.name,
    required this.percent,
    required this.product,
  });

  int id;
  DateTime endDate;
  String image;
  String name;
  int percent;
  List<FlashSaleResult> product;

  factory SuperFlashModelResult.fromJson(Map<String, dynamic> json) =>
      SuperFlashModelResult(
        id: json["id"] ?? 0,
        endDate: json["end_date"] == null
            ? DateTime.now()
            : DateTime.parse(json["end_date"]),
        image: json["image"] ?? "",
        name: json["name"] ?? "",
        percent: json["percent"] ?? 0,
        product: json["product"] == null
            ? <FlashSaleResult>[]
            : List<FlashSaleResult>.from(
                json["product"].map((x) => FlashSaleResult.fromJson(x))),
      );
}
