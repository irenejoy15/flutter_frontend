// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderModel {
  final String id;
  final String productId;
  final int quantity;
  final String fullName;
  final String productName;
  final double productPrice;
  final String email;

  OrderModel({required this.id, required this.productId, required this.quantity, required this.fullName, required this.productName, required this.productPrice, required this.email});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'productId': productId,
      'quantity': quantity,
      'fullName': fullName,
      'productName': productName,
      'productPrice': productPrice,
      'email': email,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'] as String,
      productId: map['productId'] as String,
      quantity: map['quantity'] as int,
      fullName: map['fullName'] as String,
      productName: map['productName'] as String,
      productPrice: map['productPrice'] as double,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) => OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
