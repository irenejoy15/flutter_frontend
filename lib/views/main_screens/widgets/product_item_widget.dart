import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/views/main_screens/details/product_detail_screen.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductModel product;
  const ProductItemWidget({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to product detail screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(product: product),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Color(0xffF2F2F2),
                  borderRadius: BorderRadius.circular(24),
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    product.imageUrl,
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        
              SizedBox(height: 8),
              Text(
                product.productName,
                style:GoogleFonts.poppins(
                  fontSize: 16, 
                  color: Color(0xFF212121),
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                product.category,
                style: GoogleFonts.poppins(
                  fontSize: 13, 
                  color: Color(0xFF868D94)
                )
              ),
              Text(
                '\$${product.productPrice.toStringAsFixed(2)}',
                style: GoogleFonts.poppins(
                  fontSize: 15, 
                  color: Colors.purple,
                  fontWeight: FontWeight.bold
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}