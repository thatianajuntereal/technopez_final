import 'package:flutter/material.dart';
import 'package:flutter_riverpod_base/src/feature/product/view/product_list_details.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  static const routePath = "/home";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProductsList(),
    );
  }
}
