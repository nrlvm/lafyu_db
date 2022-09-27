class GetOrderModel {
  GetOrderModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<GetOrderModelResult> results;

  factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
        count: json["count"] ?? 0,
        next: json["next"] ?? '',
        previous: json["previous"] ?? 0,
        results: json["results"] == null
            ? <GetOrderModelResult>[]
            : List<GetOrderModelResult>.from(json["results"].map((x) => GetOrderModelResult.fromJson(x))),
      );
}

class GetOrderModelResult {
  GetOrderModelResult({
    required this.id,
    required this.price,
    required this.status,
    required this.phone,
    required this.city,
    required this.location,
    required this.user,
  });

  int id;
  String price;
  String status;
  String phone;
  String city;
  String location;
  int user;

  factory GetOrderModelResult.fromJson(Map<String, dynamic> json) => GetOrderModelResult(
        id: json["id"] ?? 0,
        price: json["price"] ?? '',
        status: json["status"]??'',
        phone: json["phone"] ?? '',
        city: json["city"] ?? '',
        location: json["location"] ?? '',
        user: json["user"] ?? 0,
      );
}
