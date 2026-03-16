import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Center(
        child: Padding(padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.015),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(width * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.location_on, size: width * 0.1, color: Colors.redAccent),
                  ),
                  SizedBox(width: width * 0.04),
                  // Address Details
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text('SHIPPING ADDRESS', style: GoogleFonts.poppins(
                            fontSize: width * 0.035, 
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600
                          ),
                        ),
                        SizedBox(height: height * 0.005),
                        Text('123 Main Street, City, Country', style: GoogleFonts.poppins(
                          fontSize: width * 0.04, 
                          fontWeight: FontWeight.w600,
                          color: Colors.black87
                        )),
                        Text('Philippines', style: GoogleFonts.poppins(
                          fontSize: width * 0.04, 
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade600
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      ),
    );
  }
}