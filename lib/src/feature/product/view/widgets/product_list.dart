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
            Text(
              product.id.toString(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.network(
                      product.thumbnail!,
                      fit: BoxFit.cover,
                      width: 150.px,
                      height: 150.px,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 40.0.w,
                      child: Text(
                        product.title!,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 5.px,
                    ),
                    Text(
                      "Price: ${product.price.toString()}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Stock: ${product.stock.toString()}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Discount: ${product.discountPercentage.toString()}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
