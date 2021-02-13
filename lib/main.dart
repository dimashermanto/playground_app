import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playground_app/layout/ProductDetailPage.dart';
import 'package:playground_app/layout/ProductListPage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => ProductListPage(),
      '/productDetail': (context) => ProductDetailPage()
    },
  ));
}
