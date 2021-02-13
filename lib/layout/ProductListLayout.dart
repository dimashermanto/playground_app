import 'package:flutter/material.dart';

class ProductListLayout extends StatelessWidget {
  const ProductListLayout({
    Key key,
    @required this.productList,
  }) : super(key: key);

  final List productList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            crossAxisSpacing: 8,
            mainAxisSpacing: 16),
        itemCount: this.productList.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                      child: Image.network(
                          this.productList[index]["image"])),
                  SizedBox(
                    height: 12,
                  ),
                  Text(this.productList[index]["title"], maxLines: 2,)
                ],
              ),
            ),
          );
        });
  }
}
