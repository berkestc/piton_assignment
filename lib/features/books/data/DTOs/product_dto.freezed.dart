// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) {
  return _ProductDto.fromJson(json);
}

/// @nodoc
mixin _$ProductDto {
  int get id => throw _privateConstructorUsedError;
  int get sales => throw _privateConstructorUsedError;
  @LikeCountConverter()
  int get likesCount => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;
  String get cover => throw _privateConstructorUsedError;
  String get slug => throw _privateConstructorUsedError;
  @JsonKey(name: "created_at")
  String get createdAt => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get imageURL => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDtoCopyWith<ProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDtoCopyWith<$Res> {
  factory $ProductDtoCopyWith(
          ProductDto value, $Res Function(ProductDto) then) =
      _$ProductDtoCopyWithImpl<$Res, ProductDto>;
  @useResult
  $Res call(
      {int id,
      int sales,
      @LikeCountConverter() int likesCount,
      double price,
      String name,
      String author,
      String cover,
      String slug,
      @JsonKey(name: "created_at") String createdAt,
      String description,
      @JsonKey(ignore: true) String? imageURL});
}

/// @nodoc
class _$ProductDtoCopyWithImpl<$Res, $Val extends ProductDto>
    implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sales = null,
    Object? likesCount = null,
    Object? price = null,
    Object? name = null,
    Object? author = null,
    Object? cover = null,
    Object? slug = null,
    Object? createdAt = null,
    Object? description = null,
    Object? imageURL = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sales: null == sales
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as int,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: freezed == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductDtoCopyWith<$Res>
    implements $ProductDtoCopyWith<$Res> {
  factory _$$_ProductDtoCopyWith(
          _$_ProductDto value, $Res Function(_$_ProductDto) then) =
      __$$_ProductDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int sales,
      @LikeCountConverter() int likesCount,
      double price,
      String name,
      String author,
      String cover,
      String slug,
      @JsonKey(name: "created_at") String createdAt,
      String description,
      @JsonKey(ignore: true) String? imageURL});
}

/// @nodoc
class __$$_ProductDtoCopyWithImpl<$Res>
    extends _$ProductDtoCopyWithImpl<$Res, _$_ProductDto>
    implements _$$_ProductDtoCopyWith<$Res> {
  __$$_ProductDtoCopyWithImpl(
      _$_ProductDto _value, $Res Function(_$_ProductDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? sales = null,
    Object? likesCount = null,
    Object? price = null,
    Object? name = null,
    Object? author = null,
    Object? cover = null,
    Object? slug = null,
    Object? createdAt = null,
    Object? description = null,
    Object? imageURL = freezed,
  }) {
    return _then(_$_ProductDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      sales: null == sales
          ? _value.sales
          : sales // ignore: cast_nullable_to_non_nullable
              as int,
      likesCount: null == likesCount
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      cover: null == cover
          ? _value.cover
          : cover // ignore: cast_nullable_to_non_nullable
              as String,
      slug: null == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageURL: freezed == imageURL
          ? _value.imageURL
          : imageURL // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductDto extends _ProductDto {
  const _$_ProductDto(
      {required this.id,
      required this.sales,
      @LikeCountConverter() required this.likesCount,
      required this.price,
      required this.name,
      required this.author,
      required this.cover,
      required this.slug,
      @JsonKey(name: "created_at") required this.createdAt,
      required this.description,
      @JsonKey(ignore: true) this.imageURL})
      : super._();

  factory _$_ProductDto.fromJson(Map<String, dynamic> json) =>
      _$$_ProductDtoFromJson(json);

  @override
  final int id;
  @override
  final int sales;
  @override
  @LikeCountConverter()
  final int likesCount;
  @override
  final double price;
  @override
  final String name;
  @override
  final String author;
  @override
  final String cover;
  @override
  final String slug;
  @override
  @JsonKey(name: "created_at")
  final String createdAt;
  @override
  final String description;
  @override
  @JsonKey(ignore: true)
  final String? imageURL;

  @override
  String toString() {
    return 'ProductDto(id: $id, sales: $sales, likesCount: $likesCount, price: $price, name: $name, author: $author, cover: $cover, slug: $slug, createdAt: $createdAt, description: $description, imageURL: $imageURL)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sales, sales) || other.sales == sales) &&
            (identical(other.likesCount, likesCount) ||
                other.likesCount == likesCount) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.cover, cover) || other.cover == cover) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imageURL, imageURL) ||
                other.imageURL == imageURL));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, sales, likesCount, price,
      name, author, cover, slug, createdAt, description, imageURL);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductDtoCopyWith<_$_ProductDto> get copyWith =>
      __$$_ProductDtoCopyWithImpl<_$_ProductDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProductDtoToJson(
      this,
    );
  }
}

abstract class _ProductDto extends ProductDto {
  const factory _ProductDto(
      {required final int id,
      required final int sales,
      @LikeCountConverter() required final int likesCount,
      required final double price,
      required final String name,
      required final String author,
      required final String cover,
      required final String slug,
      @JsonKey(name: "created_at") required final String createdAt,
      required final String description,
      @JsonKey(ignore: true) final String? imageURL}) = _$_ProductDto;
  const _ProductDto._() : super._();

  factory _ProductDto.fromJson(Map<String, dynamic> json) =
      _$_ProductDto.fromJson;

  @override
  int get id;
  @override
  int get sales;
  @override
  @LikeCountConverter()
  int get likesCount;
  @override
  double get price;
  @override
  String get name;
  @override
  String get author;
  @override
  String get cover;
  @override
  String get slug;
  @override
  @JsonKey(name: "created_at")
  String get createdAt;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  String? get imageURL;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDtoCopyWith<_$_ProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}
