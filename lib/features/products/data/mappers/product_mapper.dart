import 'package:shopi/features/products/data/model/product_model.dart';

import '../../domain/entities/product.dart';

extension ProductModelMapper on ProductModel {
  Product toEntity() {
    return Product(
      id: id,
      title: title,
      description: description,
      price: price,
      discountPercentage: discountPercentage,
      rating: rating,
      stock: stock,
      brand: brand,
      category: category,
      thumbnail: thumbnail,
      images: images,
    );
  }
}