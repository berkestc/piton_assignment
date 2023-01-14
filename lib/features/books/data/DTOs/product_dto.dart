import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:piton_assignment/features/books/domain/models/product.dart';

import '../core/like_count_converter.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

@freezed
class ProductDto with _$ProductDto {
  const factory ProductDto({
    required int id,
    required int sales,
    @LikeCountConverter() @JsonKey(name: "likes_aggregate") required int likesCount,
    required double price,
    required String name,
    required String author,
    required String cover,
    required String slug,
    @JsonKey(name: "created_at") required String createdAt,
    required String description,
    @JsonKey(ignore: true) String? imageURL,
  }) = _ProductDto;

  const ProductDto._();

  factory ProductDto.fromJson(Map<String, dynamic> json) => _$ProductDtoFromJson(json);

  Product toDomain() {
    return Product(
      id: id,
      sales: sales,
      likesCount: likesCount,
      price: price,
      name: name,
      author: author,
      slug: slug,
      imageURL: imageURL!,
      createdAt: DateTime.parse(createdAt),
      description: description,
    );
  }
}
