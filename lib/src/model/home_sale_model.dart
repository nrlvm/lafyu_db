// class HomeSaleModel {
//   HomeSaleModel({
//     required this.count,
//     required this.next,
//     required this.previous,
//     required this.results,
//   });
//
//   int count;
//   String next;
//   String previous;
//   List<FlashSaleResult> results;
//
//   factory HomeSaleModel.fromJson(Map<String, dynamic> json) => HomeSaleModel(
//         count: json["count"] ?? 0,
//         next: json["next"] ?? '',
//         previous: json["previous"] ?? '',
//         results: json["results"] == null
//             ? <FlashSaleResult>[]
//             : List<FlashSaleResult>.from(
//                 json["results"].map((x) => FlashSaleResult.fromJson(x))),
//       );
// }
//
// class FlashSaleResult {
//   FlashSaleResult({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.discountPrice,
//     required this.images,
//     required this.reviewAvg,
//   });
//
//   int id;
//   String name;
//   int price;
//   double discountPrice;
//   Images images;
//   double reviewAvg;
//
//   factory FlashSaleResult.fromJson(Map<String, dynamic> json) => FlashSaleResult(
//         id: json["id"] ?? 0,
//         name: json["name"] ?? '',
//         price: json["price"] ?? 0,
//         discountPrice: json["discount_price"] ?? 0,
//         images: json["images"] == null
//             ? Images.fromJson(json)
//             : Images.fromJson(json["images"]),
//         reviewAvg:
//             json["review_avg"] == null ? 0 : json["review_avg"].toDouble(),
//       );
// }
//
// class Images {
//   Images({
//     required this.id,
//     required this.image,
//     required this.product,
//   });
//
//   int id;
//   String image;
//   int product;
//
//   factory Images.fromJson(Map<String, dynamic> json) => Images(
//         id: json["id"] ?? 0,
//         image: json["image"] ?? '',
//         product: json["product"] ?? 0,
//       );
// }
