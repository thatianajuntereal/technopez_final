// import 'package:flutter/cupertino.dart';
//
// class ProductListLoading extends StatefulWidget {
//   const ProductListLoading({super.key});
//
//   @override
//   State<ProductListLoading> createState() => _ProductListLoadingState();
// }
//
// class _ProductListLoadingState extends State<ProductListLoading> {
//   static const _pageSize = 20;
//   final PagingController<int, ProductListSummary> _pagingController =
//       PagingController(firstPageKey: 0);
//
//   @override
//   void initState() {
//     _pagingController.addPageRequestListener((pageKey) {
//       _fetchPage(pageKey);
//     });
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
