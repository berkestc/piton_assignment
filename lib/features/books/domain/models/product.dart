import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required int id,
    required int sales,
    required int likesCount,
    required double price,
    required String name,
    required String author,
    required String slug,
    required String imageURL,
    required DateTime createdAt,
    required String description,
  }) = _Product;
}
