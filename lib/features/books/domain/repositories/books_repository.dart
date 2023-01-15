import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../models/category.dart';

abstract class BooksRepository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, Unit>> likeProduct(int productId);
  Future<Either<Failure, Unit>> unlikeProduct(int productId);
}
