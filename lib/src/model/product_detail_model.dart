
import 'package:lesson_11/src/model/flash_sale_model.dart';

class ProductDetailModel {
  ProductDetailModel({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPrice,
    required this.images,
    required this.color,
    required this.size,
    required this.specification,
    required this.reviewAvg,
    required this.reviewCount,
    required this.review,
    required this.products,
    required this.category,
  });

  int id;
  String name;
  double price;
  double discountPrice;
  List<Img> images;
  List<Colore> color;
  List<Sizee> size;
  List<Specification> specification;
  double reviewAvg;
  int reviewCount;
  Review review;
  List<FlashSaleResult> products;
  String category;

  factory ProductDetailModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailModel(
        id: json["id"] ?? 0,
        name: json["name"] ?? '',
        price: json["price"] ?? 0.0,
        discountPrice: json["discount_price"] ?? 0,
        images: json["images"] == null
            ? []
            : List<Img>.from(json["images"].map((x) => Img.fromJson(x))),
        color: json["color"] == null
            ? []
            : List<Colore>.from(json["color"].map((x) => Colore.fromJson(x))),
        size: json["size"] == null
            ? []
            : List<Sizee>.from(json["size"].map((x) => Sizee.fromJson(x))),
        specification: json["specification"] == null
            ? <Specification>[]
            : List<Specification>.from(
                json["specification"].map((x) => Specification.fromJson(x))),
        reviewAvg: json["review_avg"] ?? 0,
        reviewCount: json["review_count"] ?? 0,
        review: json["review"] == null
            ? Review.fromJson({})
            : Review.fromJson(json["review"]),
        products: json["products"] == null
            ? []
            : List<FlashSaleResult>.from(
                json["products"].map((x) => FlashSaleResult.fromJson(x)),
              ),
        category: json["category"] ?? '',
      );
}

class Colore {
  Colore({
    required this.id,
    required this.color,
  });

  int id;
  String color;

  factory Colore.fromJson(Map<String, dynamic> json) => Colore(
        id: json["id"] ?? 0,
        color: json["color"] ?? '',
      );
}

class Img {
  Img({
    required this.id,
    required this.image,
    required this.product,
  });

  int id;
  String image;
  int product;

  factory Img.fromJson(Map<String, dynamic> json) => Img(
        id: json["id"] ?? 0,
        image: json["image"] ?? '',
        product: json["product"] ?? 0,
      );
}

class Review {
  Review({
    required this.user,
    required this.text,
    required this.date,
    required this.images,
    required this.start,
  });

  User user;
  String text;
  DateTime date;
  dynamic images;
  int start;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        user: json["user"] == null
            ? User.fromJson({})
            : User.fromJson(json["user"]),
        text: json["text"] ?? '',
        date: json["date"] == null
            ? DateTime.now()
            : DateTime.parse(json["date"]),
        images: json["images"]??0,
        start: json["start"] ?? 0,
      );
}

class User {
  User({
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  String firstName;
  String lastName;
  String avatar;

  factory User.fromJson(Map<String, dynamic> json) => User(
        firstName: json["first_name"] ?? '',
        lastName: json["last_name"] ?? '',
        avatar: json["avatar"] ?? '',
      );
}

class Sizee {
  Sizee({
    required this.id,
    required this.size,
  });

  int id;
  String size;

  factory Sizee.fromJson(Map<String, dynamic> json) => Sizee(
        id: json["id"] ?? 0,
        size: json["size"] ?? '',
      );
}

class Specification {
  Specification({
    required this.shown,
    required this.style,
    required this.textmodels,
  });

  String shown;
  String style;
  String textmodels;

  factory Specification.fromJson(Map<String, dynamic> json) => Specification(
        shown: json["shown"] ?? '',
        style: json["style"] ?? '',
        textmodels: json["textmodels"] ?? '',
      );
}
