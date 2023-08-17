import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart' show MJacksiIconButton;
import '../../categories/categories.dart';
import '../notifiers/products_notifier.dart';
import '../widgets/widgets.dart';
import './add_product_view.dart';

class ProductsView extends ConsumerWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'المنتجات',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  MJacksiIconButton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const AddProductView()),
                      );
                    },
                    icon: Icons.add,
                  ),
                ],
              ),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'التصنيفات',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 16,
                  ),
            ),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () {
                      ref.read(productsFilterProvider.notifier).state =
                          ProductsFilter.all;
                    },
                    child: const CategoryCardWidget(
                      categoryName: 'عرض الكل',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ref.read(productsFilterProvider.notifier).state =
                          ProductsFilter.category1;
                    },
                    child: const CategoryCardWidget(
                      categoryName: 'تصنيف ١',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ref.read(productsFilterProvider.notifier).state =
                          ProductsFilter.category2;
                    },
                    child: const CategoryCardWidget(
                      categoryName: 'تصنيف ٢',
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ref.read(productsFilterProvider.notifier).state =
                          ProductsFilter.category3;
                    },
                    child: const CategoryCardWidget(
                      categoryName: 'تصنيف ٣',
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const ShowTypeWidget(),
            const SizedBox(height: 8),
            Consumer(
              builder: (context, ref, _) {
                final products = ref.watch(filteredProducts);
                if (products.isEmpty) return const Text('ضف منتجات لمشاهدتهم');
                return Expanded(
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return ProviderScope(
                        overrides: [
                          currentProduct.overrideWithValue(products[index])
                        ],
                        child: const ProductWidget(),
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
