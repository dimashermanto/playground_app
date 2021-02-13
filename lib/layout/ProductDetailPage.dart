import 'package:flutter/material.dart';

class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: renderAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8,),
            Center(child: Image.network("https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg", height: 250,)),
            SizedBox(height: 16,),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Product 1 name", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 1.0),),
                      SizedBox(height: 6,),
                      Text("Product Category", style: TextStyle(color: Colors.grey[500], letterSpacing: 1.0, fontSize: 12),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("\$100", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, letterSpacing: 1.0),),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 16,),
            Text(
                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source.",
                style: TextStyle(letterSpacing: 1.0, height: 1.6, ),
            )
          ],
        ),
      ),
    );
  }
}
