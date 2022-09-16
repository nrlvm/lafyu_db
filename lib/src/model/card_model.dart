class CardModel {
  final int id;
  final String title;
  final String image;
  final double price;

  CardModel({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "price": price,
      };
}
