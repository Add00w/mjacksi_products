import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/products_notifier.dart';

class ProductWidget extends ConsumerWidget {
  const ProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final product = ref.watch(currentProduct);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              product.files.first,
              height: 130,
              width: 110,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width / 2,
                child: Text(
                  product.name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 18, overflow: TextOverflow.ellipsis),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text(
                    '${product.price}',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.green,
                        ),
                  ),
                  const SizedBox(width: 4),
                  const Text('دولار'),
                ],
              ),
              const SizedBox(height: 8),
              Chip(
                label: Text(product.store),
                labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
