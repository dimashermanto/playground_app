import 'package:flutter/material.dart';
import 'package:playground_app/API/ProductAPI.dart';
import 'package:playground_app/layout/ProductListLayout.dart';

void main() {
  runApp(MaterialApp(
    home: Playground(),
  ));
}

class Playground extends StatefulWidget {
  @override
  _PlaygroundState createState() => _PlaygroundState();
}

class _PlaygroundState extends State<Playground> {
  final Color baseColor = Colors.white;

  final TextStyle subLayoutTitleStyle =
      TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  List productList = [];

  Widget renderAppbar() {
    return AppBar(
      title: Text("All Products", style: TextStyle(color: Colors.black),),
      backgroundColor: baseColor,
      centerTitle: true,
      elevation: 3,
    );
  }

  void getProductList() async {
    ProductList productListInstance = ProductList();
    List productList = await productListInstance.getProductList();

    setState(() {
      this.productList = productList;
    });
  }

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: renderAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductListLayout(productList: productList),
        ));
  }
}

