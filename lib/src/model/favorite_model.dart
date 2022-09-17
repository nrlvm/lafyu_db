class FavoriteModel {
  final int id;
  final double starCount;
  final double price;
  final String title;
  final String image;

  FavoriteModel({
    required this.id,
    required this.starCount,
    required this.price,
    required this.title,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "price": price,
        "star_count": starCount,
      };
}
