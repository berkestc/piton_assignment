import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'package:piton_assignment/constants/api_constants.dart';
import 'package:piton_assignment/core/failure.dart';
import 'package:piton_assignment/features/books/data/DTOs/category_dto.dart';
import 'package:piton_assignment/features/books/data/DTOs/product_dto.dart';
import 'package:piton_assignment/features/books/domain/models/category.dart';
import 'package:piton_assignment/features/books/domain/repositories/books_repository.dart';

class BooksRepositoryImpl implements BooksRepository {
  final Client client;

  const BooksRepositoryImpl({required this.client});

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final categoriesResponse = await client.get(Uri.parse(ApiConstants.baseUrl + ApiConstants.categoriesEndpoint));

      if (categoriesResponse.statusCode == 200) {
        final decoded = jsonDecode(categoriesResponse.body) as Map<String, dynamic>;

        final categories = <Category>[];

        final categoryMaps = (decoded["category"] as List).cast<Map<String, dynamic>>();

        for (final categoryMap in categoryMaps) {
          var categoryDto = CategoryDto.fromJson(categoryMap);

          final productsResponse =
              await client.get(Uri.parse("${ApiConstants.baseUrl}${ApiConstants.productsEndpoint}/${categoryDto.id}"));

          if (productsResponse.statusCode == 200) {
            final decoded = jsonDecode(productsResponse.body) as Map<String, dynamic>;

            final productMaps = (decoded["product"] as List).cast<Map<String, dynamic>>();

            final productDtos = <ProductDto>[];

            for (final productMap in productMaps) {
              var productDto = ProductDto.fromJson(productMap);

              final imageUrlResponse = await client.post(
                Uri.parse(ApiConstants.baseUrl + ApiConstants.productCoverImageEndpoint),
                body: {"fileName": productDto.cover},
              );

              if (imageUrlResponse.statusCode == 200) {
                final decoded = jsonDecode(imageUrlResponse.body) as Map<String, dynamic>;

                final imageURL = (decoded["action_product_image"] as Map<String, dynamic>)["url"] as String;

                productDto = productDto.copyWith(imageURL: imageURL);
                productDtos.add(productDto);
              } else {
                return left(const Failure.unknownError());
              }
            }

            categoryDto = categoryDto.copyWith(products: productDtos);
          } else {
            return left(const Failure.unknownError());
          }

          categories.add(categoryDto.toDomain());
        }

        return right(categories);
      } else {
        return left(const Failure.unknownError());
      }
    } catch (e) {
      return left(const Failure.unknownError());
    }
  }
}
