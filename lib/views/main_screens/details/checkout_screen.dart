import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/controllers/order_controller.dart';
import 'package:shop_app/provider/cart_notifier.dart';
import 'package:shop_app/provider/user_notifier.dart';

class CheckoutScreen extends ConsumerStatefulWidget {
  const CheckoutScreen({super.key});

  @override
  ConsumerState<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends ConsumerState<CheckoutScreen> {
  final OrderController _orderController = OrderController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    final cartData = ref.watch(cartProvider);
    final _cartProvider = ref.read(cartProvider.notifier);
    final user = ref.read(userProvider);
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
            ),
            SizedBox(height: height * 0.02),
            Text('Your Items', style: GoogleFonts.lato(
              fontSize: width * 0.04, 
              fontWeight: FontWeight.bold,
              color: Colors.black87
            ),),
            SizedBox(height: height * 0.01),
            Expanded(child: ListView.builder(
              itemBuilder: (context, index) {
                final item = cartData.values.toList()[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: height * 0.005),
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
                  child: ListTile(
                    leading: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(item.productName, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Quantity: ${item.quantity}', style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600)),
                        Text('Price: \$${(item.productPrice * item.quantity).toStringAsFixed(2)}', style: GoogleFonts.poppins(fontSize: 14, color: const Color.fromARGB(255, 255, 0, 0))),
                      ],
                    ),
                  ),
                );
              },
              itemCount: cartData.length)
            ),
          ],
        ),
      ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.05, vertical: height * 0.015),
        child: ElevatedButton(
          onPressed: () async {
            // Handle checkout action
            await Future.forEach(_cartProvider.getCartItems.entries, (entry){
              final item = entry.value;
               _orderController.placeOrder(
                id: item.id,
                quantity: item.quantity,
                fullName: user!.fullName, // Replace with actual user data
                productName: item.productName,
                productPrice: item.productPrice,
                email: user.email, // Replace with actual user data
                ref: ref,
                context: context, 
               );
            });
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: height * 0.02),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.deepPurpleAccent,
          ),
          child: Text('Proceed to Payment', style: GoogleFonts.poppins(fontSize: width * 0.045, fontWeight: FontWeight.bold, color: Colors.white )),
        ),
      ),
    );
  }
}