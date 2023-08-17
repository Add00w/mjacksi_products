import 'dart:io' show File;

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/product_model.dart';
import 'package:uuid/uuid.dart';

var _uuid = const Uuid();

/// An object that controls a list of [Products].
class ProductsNotifier extends StateNotifier<List<ProductModel>> {
  ProductsNotifier() : super([]);

  void add({
    required String name,
    required double price,
    required List<File> files,
    String category = '',
    required String store,
  }) {
    state = [
      ...state,
      ProductModel(
          id: _uuid.v4(),
          name: name,
          price: price,
          files: files,
          category: category,
          store: store),
    ];
  }

  void filterByCategory(String category) {}
}

/// Creates a [ProductModel] and initialise it with pre-defined values.
///
/// We are using [StateNotifierProvider] here as a `List<ProductModel>`
/// is a complex object.
final productsProvider =
    StateNotifierProvider<ProductsNotifier, List<ProductModel>>((ref) {
  return ProductsNotifier();
});

/// The different ways to filter the list of products
enum ProductsFilter {
  all('عرض الكل'),
  category1('تصنيف ١'),
  category2('تصنيف ٢'),
  category3('تصنيف ٣');

  final String value;
  const ProductsFilter(this.value);
}

/// The currently active filter.
///
/// We use [StateProvider] here as there is no fancy logic behind manipulating
/// the value since it's just enum.
final productsFilterProvider = StateProvider((_) => ProductsFilter.all);

/// The list of products after applying of [ProductsFilter].
///
/// This too uses [Provider], to avoid recomputing the filtered list unless either
/// the filter of or the products updates.
final filteredProducts = Provider<List<ProductModel>>((ref) {
  final filter = ref.watch(productsFilterProvider);
  final products = ref.watch(productsProvider);

  switch (filter) {
    case ProductsFilter.category1 ||
          ProductsFilter.category2 ||
          ProductsFilter.category3:
      return products
          .where((product) => product.category == filter.value)
          .toList();
    case ProductsFilter.all:
      return products;
  }
});

/// This ensures that when we add, only the
/// impacted widgets rebuilds, instead of the entire list of items.
final currentProduct =
    Provider<ProductModel>((ref) => throw UnimplementedError());
