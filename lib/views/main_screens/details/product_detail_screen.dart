import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/models/product_model.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail',style: GoogleFonts.poppins(
          fontSize: 18, 
          fontWeight: FontWeight.bold,
          color: Color(0xFF212121),
        ),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
               child:  Image.network(
                  widget.product.imageUrl,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Product Name and & Price
            Padding(padding: EdgeInsets.symmetric(horizontal: 8),
            child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.productName,
                    style: GoogleFonts.poppins(
                      fontSize: 17, 
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7,
                      color: Color.fromARGB(255, 197, 60, 239),
                  ),),
                  Text(
                    '\$${widget.product.productPrice.toStringAsFixed(2)}',
                    style: GoogleFonts.poppins(
                      fontSize: 17, 
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.7,
                      color: Color.fromARGB(255, 197, 60, 239),
                  ),),
              ],),
            )
          ],
        ),
      ),
    );
  }
}