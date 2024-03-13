import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/product/controller/product_list_controller.dart';
import 'package:flutter_riverpod_base/src/feature/product/view/widgets/product_list.dart';
import 'package:flutter_riverpod_base/src/models/product.dart';

import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductsList extends ConsumerWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PagingController<int, ProductList> pagingController =
        PagingController(firstPageKey: 1);

    void fetchData(int pageKey) async {
      try {
        var response = await http.get(
            Uri.parse('https://dummyjson.com/products?limit=10&skip=$pageKey'));
        var data = dataModelFromJson(response.body);
        pagingController.appendPage(data, pageKey + 1);
      } catch (error) {
        pagingController.error = error;
      }
    }

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
            // PagedListView<int, ProductList>(
            //     pagingController: pagingController,
            //     builderDelegate: PagedChildBuilderDelegate<ProductList>(
            //         itemBuilder: (context, model, index) => ListTile(
            //               title: Text(model.id.toString()),
            //               // leading: Container(
            //               //   child: Image.network(model.imageUrl),
            //               // ),
            //             )));
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
