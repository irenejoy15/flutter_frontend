import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_app/models/category_model.dart';

class CategoryController {
  Future<List<CategoryModel>> fetchCategories() async{
    http.Response response = await http.get(Uri.parse('https://u8108nn405.execute-api.us-east-1.amazonaws.com/categories'));
    if(response.statusCode == 200){
      final List data = json.decode(response.body);
      return data.map((e) => CategoryModel.fromMap(e)).toList();
    }else{
      throw Exception('Failed to load categories');
    }
  }
}