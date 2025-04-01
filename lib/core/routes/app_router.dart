import 'package:flutter/material.dart';
import '../../features/products/presentation/pages/product_list_page.dart';
import '../../features/products/presentation/pages/product_detail_page.dart';

class AppRouter {
  static const String home = '/';
  static const String productDetail = '/product-detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const ProductListPage());
      case productDetail:
        final productId = settings.arguments as int;
        return MaterialPageRoute(
          builder: (_) => ProductDetailPage(productId: productId),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
} 