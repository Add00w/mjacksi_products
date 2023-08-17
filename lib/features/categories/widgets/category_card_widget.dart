import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../products/notifiers/products_notifier.dart';

class CategoryCardWidget extends ConsumerWidget {
  const CategoryCardWidget({
    super.key,
    required this.categoryName,
  });
  final String categoryName;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(productsFilterProvider).value;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: filter == categoryName ? Colors.green : Colors.transparent,
        ),
      ),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          children: [
            const SizedBox(height: 8),
            const FlutterLogo(size: 46),
            const SizedBox(height: 24),
            Text(
              categoryName,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 12,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
