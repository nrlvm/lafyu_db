
class SaveOrderModel {
  SaveOrderModel({
    required this.products,
    required this.phone,
    required this.city,
    required this.location,
  });

  List<Product> products;
  String phone;
  String city;
  String location;

  factory SaveOrderModel.fromJson(Map<String, dynamic> json) => SaveOrderModel(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    phone: json["phone"],
    city: json["city"],
    location: json["location"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "phone": phone,
    "city": city,
    "location": location,
  };
}

class Product {
  Product({
    required this.productId,
    required this.count,
  });

  int productId;
  int count;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "count": count,
  };
}
