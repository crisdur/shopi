import 'package:dartz/dartz.dart';
import '../entities/product.dart';
import '../../../../core/errors/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProducts({int skip = 0, int limit = 10});
  Future<Either<Failure, Product>> getProductById(int id);
} 