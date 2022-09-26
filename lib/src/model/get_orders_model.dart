// // To parse this JSON data, do
// //
// //     final orderBloc = orderBlocFromJson(jsonString);
//
// import 'dart:convert';
//
// OrderBloc orderBlocFromJson(String str) => OrderBloc.fromJson(json.decode(str));
//
// String orderBlocToJson(OrderBloc data) => json.encode(data.toJson());
//
// class OrderBloc {
//   OrderBloc({
//     required this.count,
//     required this.next,
//     required this.previous,
//     required this.results,
//   });
//
//   int count;
//   String next;
//   dynamic previous;
//   List<Result> results;
//
//   factory OrderBloc.fromJson(Map<String, dynamic> json) => OrderBloc(
//     count: json["count"],
//     next: json["next"],
//     previous: json["previous"],
//     results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "count": count,
//     "next": next,
//     "previous": previous,
//     "results": List<dynamic>.from(results.map((x) => x.toJson())),
//   };
// }
//
// class Result {
//   Result({
//     required this.id,
//     required this.price,
//     required this.status,
//     required this.phone,
//     required this.city,
//     required this.location,
//     required this.user,
//   });
//
//   int id;
//   String price;
//   Status status;
//   String phone;
//   String city;
//   String location;
//   int user;
//
//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//     id: json["id"],
//     price: json["price"],
//     status: statusValues.map[json["status"]],
//     phone: json["phone"],
//     city: json["city"],
//     location: json["location"],
//     user: json["user"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "price": price,
//     "status": statusValues.reverse[status],
//     "phone": phone,
//     "city": city,
//     "location": location,
//     "user": user,
//   };
// }
//
//
// }
