import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/models/confrim_user.dart';
import 'package:shop_app/models/sign_in_user.dart';
import 'package:shop_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app/views/confirm_sign_up_screen.dart';
import 'package:shop_app/views/main_screens/main_screen.dart';
import 'package:shop_app/views/sign_in_screen.dart';
class AuthController{
  Future<void> signUpUsers({
      required String email, 
      required String fullName,
      required String password,
      required context
    }) async {
      try{
        User user = User(email: email, fullName: fullName, password: password);
        http.Response response = await http.post(
          Uri.parse('https://d1b8e92y2m.execute-api.us-east-1.amazonaws.com/sign-up'),
          headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
          body: user.toJson(),
        );
        if (response.statusCode == 200) {
          await Navigator.push(
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

  Future<void> confirmSignUp({
    required String email,
    required String confirmationCode,
    required context
  }) async {
    try{
      ConfirmUser confirmUser = ConfirmUser(email: email, confirmationCode: confirmationCode);
      http.Response response = await http.post(
        Uri.parse('https://d1b8e92y2m.execute-api.us-east-1.amazonaws.com/confirm-sign-up'),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: confirmUser.toJson(),
      );
      if (response.statusCode == 200) {
        await Navigator.push(
            context,
            MaterialPageRoute(builder: (context){
              return SignInScreen();
            }),
          );
      } else {
        ScaffoldMessenger.of( context).showSnackBar(
          SnackBar(content: Text(json.decode(response.body)['details'])),
        );
      }
    }catch(e){
      ScaffoldMessenger.of( context).showSnackBar(
        SnackBar(content: Text('Error confirming user: $e')),
      );
    }
  }

  Future <void> signInUser({
    required String email,
    required String password,
    required context
  }) async {
    try{
      SignInUser signInUser = SignInUser(email: email, password: password);
      http.Response response = await http.post(
        Uri.parse('https://d1b8e92y2m.execute-api.us-east-1.amazonaws.com/sign-in'),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8'},
        body: signInUser.toJson(),
      );
      if(response.statusCode == 200){
        await Navigator.push(
            context,
            MaterialPageRoute(builder: (context){
              return MainScreen();
            }),
          );
      }else{
        ScaffoldMessenger.of( context).showSnackBar(
          SnackBar(content: Text(json.decode(response.body)['details'])),
        );
      }
    }catch(e){
      ScaffoldMessenger.of( context).showSnackBar(
        SnackBar(content: Text('Error signing in user: $e')),
      );
    }
  }
}