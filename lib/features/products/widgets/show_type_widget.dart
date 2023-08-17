import 'package:flutter/material.dart';

class ShowTypeWidget extends StatelessWidget {
  const ShowTypeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: SizedBox(
        width: 230,
        height: 40,
        child: Card(
          margin: EdgeInsets.zero,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Icon(Icons.grid_view, color: Colors.red),
                Text(
                  'تغيير عرض المنتجات الى افقي',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.red,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
