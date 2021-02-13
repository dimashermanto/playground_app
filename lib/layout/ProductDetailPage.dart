import 'package:flutter/material.dart';
import 'package:playground_app/API/ProductDetail.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  Map productDetail = {};
  bool isProgressIndicatorVisible = true;
  bool isProductDetailVisible = false;

  Widget renderAppbar() {
    return AppBar(
      title: Text("Product", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700, letterSpacing: 1.0),),
      iconTheme: IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: GestureDetector(
              child: Icon(Icons.shopping_cart_outlined)
          ),
        )
      ],
    );
  }

  Future<void> getProductDetail(String productId) async{
    ProductDetail productDetailInstance = ProductDetail(productId);

    Map productDetail = await productDetailInstance.getProductDetail();

    setState(() {
      this.productDetail = productDetail;
      this.isProgressIndicatorVisible = false;
      this.isProductDetailVisible = true;
    });
  }


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Map passedProductData = ModalRoute.of(context).settings.arguments;

    print("Product ID : ${passedProductData["productId"]}");
    getProductDetail(passedProductData["productId"].toString());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: renderAppbar(),
      floatingActionButton: Visibility(
        visible: this.isProductDetailVisible,
        child: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: (){},
          child: Icon(Icons.shopping_basket),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8,),
              Center(child: Image.network("${this.productDetail["image"]}", height: 250,)),
              SizedBox(height: 16,),
              Visibility(
                visible: this.isProgressIndicatorVisible,
                child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ),
              Visibility(
                visible: this.isProductDetailVisible,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${this.productDetail["title"]}", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 1.0,), maxLines: 3,),
                          SizedBox(height: 6,),
                          Text("${this.productDetail["category"]}", style: TextStyle(color: Colors.grey[500], letterSpacing: 1.0, fontSize: 12),),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("\$${this.productDetail["price"]}", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 1.0),),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Visibility(
                visible: this.isProductDetailVisible,
                child: Text(
                  "${this.productDetail["description"]}",
                  style: TextStyle(letterSpacing: 1.0, height: 1.6, ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
