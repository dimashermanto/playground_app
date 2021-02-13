import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key key,
    @required this.productList,
    this.index
  }) : super(key: key);

  final List productList;
  final int index;

  @override
  Widget build(BuildContext context) {

    Radius cardBorderRadius = Radius.circular(12.0);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(cardBorderRadius)),
      child: InkWell(
        onTap: (){
          print("The item's name is ${this.productList[index]["title"]}");
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
                        this.productList[index]["image"]),
                  )),
              SizedBox(
                height: 12,
              ),

              //Product Name
              Text(this.productList[index]["title"], maxLines: 2,),
              SizedBox(
                height: 12,
              ),

              //Product Price
              Text(
                "\$${this.productList[index]["price"]}",
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
