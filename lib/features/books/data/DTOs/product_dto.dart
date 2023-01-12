import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:piton_assignment/features/books/domain/models/product.dart';

part 'product_dto.freezed.dart';
part 'product_dto.g.dart';

class LikeCountConverter extends JsonConverter<int, Map<String, dynamic>> {
  const LikeCountConverter();

  @override
  int fromJson(Map<String, dynamic> json) {
    return ((json['likes_aggregate'] as Map<String, dynamic>)["aggregate"] as Map<String, dynamic>)["count"] as int;
  }

  @override
  Map<String, dynamic> toJson(int object) {
    return {
      "likes_aggregate": {
        "aggregate": {"count": object}
      }
    };
  }
}

@freezed
class ProductDto with _$ProductDto {
  const factory ProductDto({
    required int id,
    required int sales,
    @LikeCountConverter() required int likesCount,
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
