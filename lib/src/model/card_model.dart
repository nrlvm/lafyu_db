class CartModel {
  final int id;
  final String title;
  final String image;
  final double price;
  int cardCount;
  double starCount;
  bool isFavorite;

  CartModel({
    this.starCount = 0,
    this.isFavorite = false,
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.cardCount,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "price": price,
        "card_count": cardCount,
      };
}
