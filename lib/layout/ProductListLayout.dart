import 'package:flutter/material.dart';
import 'package:playground_app/layout/ProductCardLayout.dart';

class ProductListLayout extends StatelessWidget {
  const ProductListLayout({
    Key key,
    @required this.productList
  }) : super(key: key);

  final List productList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 225,
            mainAxisExtent: 225,
            crossAxisSpacing: 6,
            mainAxisSpacing: 8,
        ),
        itemCount: this.productList.length,
        itemBuilder: (context, index) {
          return ProductCard(productList: productList, index: index);
        });
  }
}
