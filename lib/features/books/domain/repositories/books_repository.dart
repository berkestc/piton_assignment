import 'package:dartz/dartz.dart';
import 'package:piton_assignment/core/failure.dart';
import 'package:piton_assignment/features/books/domain/models/category.dart';

abstract class BooksRepository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, Unit>> likeProduct(int productId);
  Future<Either<Failure, Unit>> unlikeProduct(int productId);
}
