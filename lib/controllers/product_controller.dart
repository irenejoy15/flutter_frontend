// STEP 2
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/product_model.dart';

class ProductController {
  Future<List<ProductModel>> fetchProducts() async{
    http.Response response = await http.get(Uri.parse('https://4sfecl9ji9.execute-api.us-east-1.amazonaws.com/products'));
    if(response.statusCode == 200){
      final List data = json.decode(response.body)['products'];
      return data.map((e) => ProductModel.fromMap(e)).toList();
    }else{
      throw Exception('Failed to load products');
    }
  }

  Future<List<ProductModel>> fetchProductsByCategory(String category) async{
    http.Response response = await http.get(Uri.parse('https://4sfecl9ji9.execute-api.us-east-1.amazonaws.com/products/by-category?category=${Uri.encodeComponent(category)}'));
    if(response.statusCode == 200){
      final List data = json.decode(response.body)['products'];
      return data.map((e) => ProductModel.fromMap(e)).toList();
    }
    else if(response.statusCode == 404){
      return [];
    }
    else{
      throw Exception('Failed to load products by category');
    }
  }

}
// END STEP 2