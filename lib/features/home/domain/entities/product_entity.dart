import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final double price;
  final String? description;
  final String? category;
  final List<String>? tags;
  final double? rating;
  final String? brand;
  final String? thumbnail;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    this.description,
    this.category,
    this.rating,
    this.tags,
    this.brand,
    this.thumbnail,
  });

  @override
  List<Object?> get props {
    return [
      id,
      title,
      price,
      description,
      category,
      rating,
      tags,
      brand,
      thumbnail,
    ];
  }

  bool searchString(String text) {
    String searchIn = title;

    if (description != null) searchIn += description!;
    if (category != null) searchIn += category!;
    if (tags != null) searchIn += tags!.join();
    if (brand != null) searchIn += brand!;

    return searchIn.toLowerCase().contains(text.toLowerCase());
  }
}
