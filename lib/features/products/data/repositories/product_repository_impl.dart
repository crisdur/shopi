import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ApiClient apiClient;

  ProductRepositoryImpl({required this.apiClient});

  @override
  Future<Either<Failure, List<Product>>> getProducts({
    int skip = 0,
    int limit = 10,
  }) async {
    try {
      final response = await apiClient.get('/products?skip=$skip&limit=$limit');
      final products = (response['products'] as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
      return Right(products);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, Product>> getProductById(int id) async {
    try {
      final response = await apiClient.get('/products/$id');
      final product = ProductModel.fromJson(response);
      return Right(product);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }
} 