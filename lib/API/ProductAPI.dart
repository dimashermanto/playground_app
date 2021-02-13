import 'package:http/http.dart';
import 'dart:convert';

class ProductList{
  List productList;

  ProductList();

  Future<List> getProductList() async{
    try{
      Response response = await get("https://fakestoreapi.com/products");
      List productList = jsonDecode(response.body);

      this.productList = productList;
      return this.productList;

    }catch(error){
      return error;
    }
  }

}