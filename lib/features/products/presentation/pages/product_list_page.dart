import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';
import '../../../../core/constants/colors.dart';

class ProductListPage extends ConsumerStatefulWidget {
  const ProductListPage({super.key});

  @override
  ConsumerState<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends ConsumerState<ProductListPage> {
  final ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (!isLoadingMore) {
        setState(() => isLoadingMore = true);
        ref.read(productsProvider.notifier).loadMoreProducts().then((_) {
          setState(() => isLoadingMore = false);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final productsAsync = ref.watch(productsProvider);
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;
    final crossAxisCount = isTablet ? 3 : 2;
    final childAspectRatio = isTablet ? 0.8 : 0.75;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Shopi'),
        centerTitle: true,
      ),
      body: productsAsync.when(
        data: (products) => CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(isTablet ? 16 : 10),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index == products.length) {
                      return isLoadingMore
                          ? Center(
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const CircularProgressIndicator(),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Loading more...',
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: isTablet ? 14 : 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox();
                    }
                    return Padding(
                      padding: EdgeInsets.all(isTablet ? 8 : 4),
                      child: ProductCard(
                        product: products[index],
                        onTap: () => Navigator.pushNamed(
                          context,
                          '/product-detail',
                          arguments: products[index].id,
                        ),
                      ),
                    );
                  },
                  childCount: products.length + 1,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: childAspectRatio,
                  crossAxisSpacing: isTablet ? 16 : 8,
                  mainAxisSpacing: isTablet ? 16 : 8,
                ),
              ),
            ),
          ],
        ),
        loading: () => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
              const SizedBox(height: 16),
              Text(
                'Loading products...',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: isTablet ? 16 : 14,
                ),
              ),
            ],
          ),
        ),
        error: (error, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                color: AppColors.error,
                size: 48,
              ),
              const SizedBox(height: 16),
              Text(
                'Error loading products',
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: isTablet ? 20 : 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: isTablet ? 16 : 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 