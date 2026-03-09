import 'dart:convert';

import 'package:shop_app/models/banner_model.dart';
import 'package:http/http.dart' as http;

class BannerController {
  Future<List<BannerModel>> fetchBanners() async{
    http.Response response = await http.get(Uri.parse('https://lkcfa3gfvg.execute-api.us-east-1.amazonaws.com/ads'));
    if(response.statusCode == 200){
      final List data = json.decode(response.body);
      return data.map((e) => BannerModel.fromMap(e)).toList();
    }else{
      throw Exception('Failed to load banners');
    }
  }
}