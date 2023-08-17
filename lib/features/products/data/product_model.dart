import 'dart:io' show File;

import 'package:flutter/foundation.dart' show immutable;

/// A read-only description of a product
@immutable
class ProductModel {
  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.files,
    this.category = '',
    required this.store,
  });

  final String id;
  final String name;
  final String store;
  final double price;
  final String category;
  final List<File> files;
  @override
  String toString() {
    return 'ProductModel(name: $name,price:$price,category:$category store: $store)';
  }
}
