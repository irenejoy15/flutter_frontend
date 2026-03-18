import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/provider/product_notifier.dart';

class ProductByCategoryScreen extends ConsumerStatefulWidget {
  final String category;
  const ProductByCategoryScreen({super.key, required this.category});

  @override
  ConsumerState<ProductByCategoryScreen> createState() => _ProductByCategoryScreenState();
}

class _ProductByCategoryScreenState extends ConsumerState<ProductByCategoryScreen> {
  late Future<List<ProductModel>> _productsFuture;
  @override
  void initState() {
    super.initState();
    ProductController().fetchProductsByCategory(widget.category).then((products){
      ref.read(productProvider.notifier).setProduct(products);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final products = ref.watch(productProvider);
          if (products.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Image(image: NetworkImage(product.imageUrl), height: 100, width: 100, fit: BoxFit.cover,),
                subtitle: Text('\$${product.productPrice.toStringAsFixed(2)}'),
              );
            },
          );
        },
      ),
    );
  }
}