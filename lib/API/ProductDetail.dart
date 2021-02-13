import 'package:http/http.dart';
import 'dart:convert';

class ProductDetail{
  String productId;

  ProductDetail(this.productId);

  Future<Map> getProductDetail() async{
    try{
      Response response = await get("https://fakestoreapi.com/products/$productId");
      Map productDetail = jsonDecode(response.body);

      print(productDetail);

      return productDetail;

    }catch(error){
      return error;
    }
  }

}