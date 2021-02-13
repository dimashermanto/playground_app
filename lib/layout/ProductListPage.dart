import 'package:flutter/material.dart';
import 'package:playground_app/API/ProductAPI.dart';
import 'package:playground_app/layout/ProductListLayout.dart';


class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final Color baseColor = Colors.white;

  final TextStyle subLayoutTitleStyle =
  TextStyle(fontSize: 18, fontWeight: FontWeight.bold);

  List productList = [];
  bool isProgressIndicatorVisible = true;
  bool isProductListVisible = false;

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
      this.isProgressIndicatorVisible = false;
      this.isProductListVisible = true;
    });
  }

  void navigateToDetail(String productId){
    Navigator.pushNamed(context, "/productDetail", arguments: {
      "productId": productId
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
        body: Column(
          children: [

            Visibility(visible: this.isProgressIndicatorVisible, child: SizedBox(height: 36,)),

            Visibility(
              visible: this.isProgressIndicatorVisible,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              ),
            ),
            Expanded(
              child: Visibility(
                visible: this.isProductListVisible,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ProductListLayout(productList: productList),
                ),
              ),
            ),
          ],
        ));
  }
}

