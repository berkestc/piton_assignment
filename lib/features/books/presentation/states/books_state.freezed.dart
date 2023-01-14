// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'books_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BooksState {
  Option<Failure> get failure => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  List<int> get likedProductIds => throw _privateConstructorUsedError;
  Option<int> get selectedCategoryId => throw _privateConstructorUsedError;
  String get searchFilter => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BooksStateCopyWith<BooksState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BooksStateCopyWith<$Res> {
  factory $BooksStateCopyWith(
          BooksState value, $Res Function(BooksState) then) =
      _$BooksStateCopyWithImpl<$Res, BooksState>;
  @useResult
  $Res call(
      {Option<Failure> failure,
      List<Category> categories,
      List<int> likedProductIds,
      Option<int> selectedCategoryId,
      String searchFilter,
      bool isLoading});
}

/// @nodoc
class _$BooksStateCopyWithImpl<$Res, $Val extends BooksState>
    implements $BooksStateCopyWith<$Res> {
  _$BooksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? categories = null,
    Object? likedProductIds = null,
    Object? selectedCategoryId = null,
    Object? searchFilter = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      likedProductIds: null == likedProductIds
          ? _value.likedProductIds
          : likedProductIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedCategoryId: null == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      searchFilter: null == searchFilter
          ? _value.searchFilter
          : searchFilter // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BooksStateCopyWith<$Res>
    implements $BooksStateCopyWith<$Res> {
  factory _$$_BooksStateCopyWith(
          _$_BooksState value, $Res Function(_$_BooksState) then) =
      __$$_BooksStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Option<Failure> failure,
      List<Category> categories,
      List<int> likedProductIds,
      Option<int> selectedCategoryId,
      String searchFilter,
      bool isLoading});
}

/// @nodoc
class __$$_BooksStateCopyWithImpl<$Res>
    extends _$BooksStateCopyWithImpl<$Res, _$_BooksState>
    implements _$$_BooksStateCopyWith<$Res> {
  __$$_BooksStateCopyWithImpl(
      _$_BooksState _value, $Res Function(_$_BooksState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? categories = null,
    Object? likedProductIds = null,
    Object? selectedCategoryId = null,
    Object? searchFilter = null,
    Object? isLoading = null,
  }) {
    return _then(_$_BooksState(
      failure: null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Option<Failure>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      likedProductIds: null == likedProductIds
          ? _value._likedProductIds
          : likedProductIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      selectedCategoryId: null == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as Option<int>,
      searchFilter: null == searchFilter
          ? _value.searchFilter
          : searchFilter // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BooksState implements _BooksState {
  const _$_BooksState(
      {required this.failure,
      required final List<Category> categories,
      required final List<int> likedProductIds,
      required this.selectedCategoryId,
      required this.searchFilter,
      required this.isLoading})
      : _categories = categories,
        _likedProductIds = likedProductIds;

  @override
  final Option<Failure> failure;
  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<int> _likedProductIds;
  @override
  List<int> get likedProductIds {
    if (_likedProductIds is EqualUnmodifiableListView) return _likedProductIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_likedProductIds);
  }

  @override
  final Option<int> selectedCategoryId;
  @override
  final String searchFilter;
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'BooksState(failure: $failure, categories: $categories, likedProductIds: $likedProductIds, selectedCategoryId: $selectedCategoryId, searchFilter: $searchFilter, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BooksState &&
            (identical(other.failure, failure) || other.failure == failure) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality()
                .equals(other._likedProductIds, _likedProductIds) &&
            (identical(other.selectedCategoryId, selectedCategoryId) ||
                other.selectedCategoryId == selectedCategoryId) &&
            (identical(other.searchFilter, searchFilter) ||
                other.searchFilter == searchFilter) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      failure,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_likedProductIds),
      selectedCategoryId,
      searchFilter,
      isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BooksStateCopyWith<_$_BooksState> get copyWith =>
      __$$_BooksStateCopyWithImpl<_$_BooksState>(this, _$identity);
}

abstract class _BooksState implements BooksState {
  const factory _BooksState(
      {required final Option<Failure> failure,
      required final List<Category> categories,
      required final List<int> likedProductIds,
      required final Option<int> selectedCategoryId,
      required final String searchFilter,
      required final bool isLoading}) = _$_BooksState;

  @override
  Option<Failure> get failure;
  @override
  List<Category> get categories;
  @override
  List<int> get likedProductIds;
  @override
  Option<int> get selectedCategoryId;
  @override
  String get searchFilter;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_BooksStateCopyWith<_$_BooksState> get copyWith =>
      throw _privateConstructorUsedError;
}
