import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/category.dart';
import 'product_dto.dart';

part 'category_dto.freezed.dart';
part 'category_dto.g.dart';

@freezed
class CategoryDto with _$CategoryDto {
  @JsonSerializable(explicitToJson: true)
  const factory CategoryDto({
    required int id,
    required String name,
    @JsonKey(name: "created_at") required String createdAt,
    @Default([]) List<ProductDto> products,
  }) = _CategoryDto;

  const CategoryDto._();

  factory CategoryDto.fromJson(Map<String, dynamic> json) => _$CategoryDtoFromJson(json);

  Category toDomain() {
    return Category(
      id: id,
      name: name,
      createdAt: DateTime.parse(createdAt),
      products: products.map((e) => e.toDomain()).toList(),
    );
  }
}
