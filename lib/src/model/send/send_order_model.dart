class SendOrderModel {
  SendOrderModel({
    required this.products,
    required this.phone,
    required this.city,
    required this.location,
  });

  List<SendOrderProduct> products;
  String phone;
  String city;
  String location;

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "phone": phone,
        "city": city,
        "location": location,
      };
}

class SendOrderProduct {
  SendOrderProduct({
    required this.productId,
    required this.count,
  });

  int productId;
  int count;

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "count": count,
      };
}
