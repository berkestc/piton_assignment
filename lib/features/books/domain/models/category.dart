import 'package:freezed_annotation/freezed_annotation.dart';

import 'product.dart';

part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required int id,
    required String name,
    required DateTime createdAt,
    required List<Product> products,
  }) = _Category;
}
