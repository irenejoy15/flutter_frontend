import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/order_model.dart';
import 'package:shop_app/provider/user_notifier.dart';
import 'package:http/http.dart' as http;

class OrderController {
  Future<void> placeOrder(
    {
      required String id,
      required int quantity,
      required String fullName,
      required String productName,
      required double productPrice,
      required String email,
      required WidgetRef ref,
      required context,
    }) async {
      final idToken = ref.read(userProvider)!.idToken;
      final OrderModel orderModel = OrderModel(
        id: id,
        quantity: quantity,
        fullName: fullName,
        productName: productName,
        productPrice: productPrice,
        email: email,
      );

      try{
        http.Response response = await http.post(
          Uri.parse('https://f222umkrdg.execute-api.us-east-1.amazonaws.com/place-order'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer $idToken',
          },
          body: orderModel.toJson(),
        );

        if(response.statusCode == 201){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Order placed successfully!')),
          );
        }else{
          ScaffoldMessenger.of( context).showSnackBar(
            SnackBar(content: Text('IRENE${json.decode(response.body)['details']}')),
          );
        }

      }catch(e){
        ScaffoldMessenger.of( context).showSnackBar(
          SnackBar(content: Text('Error placing order: $e')),
        );
      }
  }
}