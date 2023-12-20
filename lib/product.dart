class Product {
  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
  });

  Product.fromJson(Map<String, Object?> json)
      : this(
          id: json["id"]! as int,
          title: json["title"]! as String,
          description: json["description"]! as String,
          price: json["price"]! as int,
          discountPercentage: json["discountPercentage"]! as double,
          rating: double.parse(json["rating"]!.toString()),
          stock: json["stock"]! as int,
          brand: json["brand"]! as String,
          category: json["category"]! as String,
          thumbnail: json["thumbnail"]! as String,
          images: (json["images"]! as List).cast<String>(),
        );

  Map<String, Object?> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "price": price,
      "discountPercentage": discountPercentage,
      "rating": rating,
      "stock": stock,
      "brand": brand,
      "category": category,
      "thumbnail": thumbnail,
      "image": images,
    };
  }
}
