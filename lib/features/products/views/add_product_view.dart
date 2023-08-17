import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/core.dart';
import '../notifiers/products_notifier.dart';
import '../widgets/widgets.dart';

class AddProductView extends ConsumerStatefulWidget {
  const AddProductView({super.key});

  @override
  ConsumerState<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends ConsumerState<AddProductView> {
  final _productNameController = TextEditingController();
  final _priceController = TextEditingController();
  final _storeController = TextEditingController();
  final _categoryController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _productNameController.dispose();
    _priceController.dispose();
    _storeController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MJacksiIconButton(
            onTap: () {
              Navigator.pop(context);
            },
            icon: Icons.arrow_back_ios,
            iconSize: 18,
            heroTag: 'add product back button',
          ),
        ),
        title: Text(
          'اضافة منتجات',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'صور المنتج',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
                    ),
              ),
              const FilesPickerWidget(),
              const SizedBox(height: 14),
              Text(
                'اسم المنتج',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
                    ),
              ),
              TextFormField(
                controller: _productNameController,
                validator: (value) {
                  if (value == null) return 'اسم المنتج مطلوب';
                },
                decoration: const InputDecoration(
                  hintText: 'اسم المنتج',
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'اسم المتجر',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
                    ),
              ),
              TextFormField(
                controller: _storeController,
                validator: (value) {
                  if (value == null) return 'اسم المتجر مطلوب';
                },
                decoration: const InputDecoration(
                  hintText: 'اسم المتجر',
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'السعر',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
                    ),
              ),
              TextFormField(
                controller: _priceController,
                validator: (value) {
                  if (value == null) return 'السعر مطلوب';
                },
                decoration: const InputDecoration(
                  hintText: 'السعر',
                ),
              ),
              const SizedBox(height: 14),
              Text(
                'التصنيف',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontSize: 18,
                    ),
              ),
              DropdownMenu(
                onSelected: (value) {
                  _categoryController.text = value ?? '';
                },
                width: MediaQuery.sizeOf(context).width * 0.9,
                dropdownMenuEntries: const <DropdownMenuEntry<String>>[
                  DropdownMenuEntry(value: 'تصنيف ١', label: 'تصنيف ١'),
                  DropdownMenuEntry(value: 'تصنيف ٢', label: 'تصنيف ٢'),
                  DropdownMenuEntry(value: 'تصنيف ٣', label: 'تصنيف ٣'),
                ],
                hintText: 'اسم التصنيف',
                trailingIcon: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  color: Color.fromRGBO(112, 134, 220, 1),
                ),
              ),
              const SizedBox(height: 14),
              ElevatedButton(
                onPressed: () {
                  final files = ref.watch(pickedFilesProvider);
                  if (_formKey.currentState!.validate() && files.isNotEmpty) {
                    ref.read(productsProvider.notifier).add(
                          name: _productNameController.text,
                          price: double.parse(_priceController.text),
                          files: files,
                          store: _storeController.text,
                          category: _categoryController.text,
                        );
                    Navigator.maybePop(context);
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                          content:
                              Text('الصور وكل الحقول مطلوبة ماعدا التصنيف'),
                        ),
                      );
                  }
                },
                child: Text(
                  'اضافة المنتج',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              const SizedBox(height: 160),
            ],
          ),
        ),
      ),
    );
  }
}
