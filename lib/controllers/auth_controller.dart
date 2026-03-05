import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/views/confirm_sign_up_screen.dart';
class AuthController{
  Future<void> signUpUsers({
      required String email, 
      required String fullName,
      required String password,
      required BuildContext context
    }) async {
      try{
        User user = User(email: email, fullName: fullName, password: password);
        http.Response response = await http.post(
          Uri.parse('https://d1b8e92y2m.execute-api.us-east-1.amazonaws.com/sign-up'),
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
          body: user.toJson(),
        );
        if (response.statusCode == 200) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context){
              return ConfirmSignUpScreen(email: email,);
            }),
          );
        } else {
          ScaffoldMessenger.of( context).showSnackBar(
            SnackBar(content: Text(json.decode(response.body)['detail'])),
          );
        }
      }catch(e){
        ScaffoldMessenger.of( context).showSnackBar(
          SnackBar(content: Text('Error signing up user: $e')),
        );
      }
  }
}