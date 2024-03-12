import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/models/product.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductListItem extends StatelessWidget {
  const ProductListItem({super.key, required this.product});

  final ProductList product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Card(
        clipBehavior: Clip.hardEdge,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0.px)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.thumbnail!),
            const SizedBox(
              height: 10,
            ),
            Text(
              product.id.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              product.title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              product.price.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              product.stock.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              product.discountPercentage.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
