// STEP 2
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shop_app/models/product_model.dart';

class ProductController {
  // This is a placeholder for the product controller logic.
  // You can add methods to fetch products, add new products, update existing products, etc.
  Future<List<ProductModel>> fetchProducts() async{
    http.Response response = await http.get(Uri.parse('https://4sfecl9ji9.execute-api.us-east-1.amazonaws.com/products'));
    if(response.statusCode == 200){
      final List data = json.decode(response.body);
      return data.map((e) => ProductModel.fromMap(e)).toList();
    }else{
      throw Exception('Failed to load products');
    }
  }
}
// END STEP 2