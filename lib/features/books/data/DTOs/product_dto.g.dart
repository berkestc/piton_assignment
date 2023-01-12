// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDto _$$_ProductDtoFromJson(Map<String, dynamic> json) =>
    _$_ProductDto(
      id: json['id'] as int,
      sales: json['sales'] as int,
      likesCount: const LikeCountConverter()
          .fromJson(json['likesCount'] as Map<String, dynamic>),
      price: (json['price'] as num).toDouble(),
      name: json['name'] as String,
      author: json['author'] as String,
      cover: json['cover'] as String,
      slug: json['slug'] as String,
      createdAt: json['created_at'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$$_ProductDtoToJson(_$_ProductDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sales': instance.sales,
      'likesCount': const LikeCountConverter().toJson(instance.likesCount),
      'price': instance.price,
      'name': instance.name,
      'author': instance.author,
      'cover': instance.cover,
      'slug': instance.slug,
      'created_at': instance.createdAt,
      'description': instance.description,
    };
