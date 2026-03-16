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
            ),
            SizedBox(height: 8),
            Padding(padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  widget.product.category,
                  style: GoogleFonts.poppins(
                    fontSize: 14, 
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 136, 136, 136),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About this product',
                      style: GoogleFonts.poppins(
                        fontSize: 16, 
                        letterSpacing: 1.7,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF212121),
                    ),),
                    SizedBox(height: 8),
                    Text(
                      widget.product.description,
                      style: GoogleFonts.poppins(
                        fontSize: 14, 
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF424242),
                    ),),
                  ],
                ),
              ),
          ],
        ),
      ),
      bottomSheet: Padding(padding: EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              // Add to cart functionality
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF6200EE),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'ADD TO CART',
              style: GoogleFonts.poppins(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: Colors.white,
            ),),
          ),
        )
      ),
    );
  }
}