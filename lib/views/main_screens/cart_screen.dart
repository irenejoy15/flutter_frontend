import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/provider/cart_notifier.dart';
import 'package:shop_app/views/main_screens/details/checkout_screen.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final cartData = ref.watch(cartProvider);
    final _cartProvider = ref.read(cartProvider.notifier);
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.06,
              color: Color(0xFFD7DDFF),
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.05, vertical: size.height * 0.02),
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.02,
                    height: size.height * 0.02,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4)
                    ),
                  ),
                  SizedBox(width: size.width * 0.03),
                  Text("You Have ${cartData.length} Items",style: GoogleFonts.poppins(
                    fontSize: 16, 
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF212121)
                  ),)
                ],
              ),
            ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartData.length,
                itemBuilder: (context, index) {
                 final item = cartData.values.toList()[index];
                 return Card(
                    margin: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05, 
                      vertical: size.height * 0.01
                    ),
                    child: ListTile(
                      leading: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                      title: Text(item.productName, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
                      subtitle: Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: size.height * 0.005),
                        decoration: BoxDecoration(
                          color: Color(0xFFD7DDFF),
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.category, style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF212121))),
                            Text('Price: \$${item.productPrice.toStringAsFixed(2)}', style: GoogleFonts.poppins(fontSize: 14, color: Color(0xFF212121))),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: size.height * 0.005),
                              width: size.width * 0.3,
                              height: size.height * 0.03,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 229, 184, 233),
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _cartProvider.decrementQuantity(item.id);
                                    },
                                    child: Icon(CupertinoIcons.minus, color: Colors.white, size: 16),
                                  ),
                                  Text(item.quantity.toString(), style: GoogleFonts.poppins(fontSize: 14, color: Colors.white)),
                                  InkWell(
                                    onTap: () {
                                      _cartProvider.incrementQuantity(item.id);
                                    },
                                    child: Icon(CupertinoIcons.plus, color: Colors.white, size: 16),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () {
                          ref.read(cartProvider.notifier).removeProduct(item.id);
                        },
                      ),
                    ),
                 );
                },
              )
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: size.width,
        height: size.height * 0.08,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: size.width * 0.9,
                height: size.height * 0.06,
                decoration: BoxDecoration(
                  color: Color(0xFF212121),
                  border: Border.all(color: Color(0xFF212121)),
                  borderRadius: BorderRadius.circular(8),
                ),

              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: Text('Total: \$${ref.watch(cartProvider.notifier).totalPrice.toStringAsFixed(2)}', 
                      style: GoogleFonts.poppins(
                        fontSize: 16, 
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),),
                  ),
                  Padding(padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CheckoutScreen()),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: size.height * 0.01),
                        decoration: BoxDecoration(
                          color: Color(0xFF212121),
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Row(
                          children: [
                            Text('Checkout', style: GoogleFonts.poppins(fontSize: size.width * 0.04, color: Colors.white)),
                            Icon(Icons.arrow_forward_ios, color: Colors.white, size: size.width * 0.04)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}