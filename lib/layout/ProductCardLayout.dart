import 'package:flutter/material.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key key,
    @required this.productList,
    this.index
  }) : super(key: key);

  final List productList;
  final int index;

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {

  void navigateToDetail(int productId){
    Navigator.pushNamed(context, "/productDetail", arguments: {
      "productId": productId
    });
  }

  @override
  Widget build(BuildContext context) {

    Radius cardBorderRadius = Radius.circular(12.0);

    int index = this.widget.index;
    List productList = this.widget.productList;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(cardBorderRadius)),
      child: InkWell(
        onTap: (){
          this.navigateToDetail(productList[index]["id"]);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6,
              ),
              //Product Image
              Expanded(
                  child: Center(
                    child: Image.network(
                        productList[index]["image"]),
                  )),
              SizedBox(
                height: 12,
              ),

              //Product Name
              Text(productList[index]["title"], maxLines: 2,),
              SizedBox(
                height: 12,
              ),

              //Product Price
              Text(
                "\$${productList[index]["price"]}",
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
