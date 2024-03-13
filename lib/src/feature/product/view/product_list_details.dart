import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/product/controller/product_list_controller.dart';
import 'package:flutter_riverpod_base/src/feature/product/view/widgets/product_list.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productController = ref.watch(productControllerProvider);

    return FutureBuilder(
      future: productController.getProducts(context: context),
      builder: (context, snapshot) {
        final data = snapshot.data;
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: Text("Error Loading Data"),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          if (data != null) {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                if (index < data.length) {
                  return ProductListItem(product: data[index]);
                } else {
                  return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 32),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ));
                }
              },
            );
          } else {
            return const Center(
              child: Text("Error Loading Data"),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
