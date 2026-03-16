import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(size.height * 0.18), child: Container(
        width: size.width,
        height: size.height * 0.18,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/cartb.png'), 
            fit: BoxFit.cover
          )
        ),
        child: Padding(padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.02
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('My Cart',style: GoogleFonts.poppins(
              fontSize: 22, 
              fontWeight: FontWeight.w600,
              color: Colors.white
            ),),
            Stack(
              children: [
                Icon(Icons.shopping_cart, color: Colors.white, size: 28),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '3', // Example cart item count
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        ),
      )),
    );
  }
}