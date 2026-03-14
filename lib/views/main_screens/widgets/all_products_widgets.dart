import 'package:flutter/material.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/views/main_screens/widgets/product_item_widget.dart';

class AllProductWidget extends StatefulWidget {
  const AllProductWidget({super.key});

  @override
  State<AllProductWidget> createState() => _AllProductWidgetState();
}

class _AllProductWidgetState extends State<AllProductWidget> {
  late Future<List<ProductModel>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = ProductController().fetchProducts();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: _productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final products = snapshot.data;
        return SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products!.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductItemWidget(product: product);
            },
          ),
        );
      },
    );
  }
}