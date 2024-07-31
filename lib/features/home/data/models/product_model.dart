import '../../domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    required super.id,
    required super.title,
    required super.price,
    super.description,
    super.category,
    super.rating,
    super.tags,
    super.brand,
    super.thumbnail,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      rating: json['rating'],
      tags: List<String>.from(json['tags']),
      brand: json['brand'],
      thumbnail: json['thumbnail'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'rating': rating,
      'tags': tags,
      'brand': brand,
      'thumbnail': thumbnail,
    };
  }
}
