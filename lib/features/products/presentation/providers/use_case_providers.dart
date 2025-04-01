import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/get_product_by_id.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(baseUrl: 'https://dummyjson.com');
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepositoryImpl(apiClient: ref.watch(apiClientProvider));
});

final getProductsProvider = Provider<GetProducts>((ref) {
  return GetProducts(ref.watch(productRepositoryProvider));
});

final getProductByIdProvider = Provider<GetProductById>((ref) {
  return GetProductById(ref.watch(productRepositoryProvider));
}); 