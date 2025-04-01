import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/get_product_by_id.dart';
import 'use_case_providers.dart';

final productsProvider = StateNotifierProvider<ProductsNotifier, AsyncValue<List<Product>>>((ref) {
  return ProductsNotifier(
    getProducts: ref.read(getProductsProvider),
    getProductById: ref.read(getProductByIdProvider),
  );
});

class ProductsNotifier extends StateNotifier<AsyncValue<List<Product>>> {
  final GetProducts getProducts;
  final GetProductById getProductById;
  int skip = 0;
  bool hasMore = true;

  ProductsNotifier({
    required this.getProducts,
    required this.getProductById,
  }) : super(const AsyncValue.loading()) {
    loadInitialProducts();
  }

  Future<void> loadInitialProducts() async {
    state = const AsyncValue.loading();
    skip = 0;
    hasMore = true;
    await _fetchProducts();
  }

  Future<void> loadMoreProducts() async {
    if (!hasMore || state.isLoading) return;
    await _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    final result = await getProducts.call(skip: skip);
    
    result.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (newProducts) {
        skip += newProducts.length;
        hasMore = newProducts.length == 10;
        
        final currentProducts = state.valueOrNull ?? [];
        state = AsyncValue.data([...currentProducts, ...newProducts]);
      },
    );
  }

  Future<Product?> fetchProductById(int id) async {
    final result = await getProductById.call(id);
    return result.fold(
      (failure) => null,
      (product) => product,
    );
  }
}