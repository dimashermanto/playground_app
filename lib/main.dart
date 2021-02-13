import 'package:flutter/material.dart';
import 'package:playground_app/layout/ProductDetailPage.dart';
import 'package:playground_app/layout/ProductListPage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => ProductListPage(),
      '/productDetail': (context) => ProductDetailPage()
    },
  ));
}
