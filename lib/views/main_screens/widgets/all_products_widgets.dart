import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/controllers/product_controller.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/views/main_screens/widgets/product_item_widget.dart';
import 'package:shop_app/provider/product_notifier.dart';

class AllProductWidget extends ConsumerStatefulWidget {
  const AllProductWidget({super.key});

  @override
  ConsumerState<AllProductWidget> createState() => _AllProductWidgetState();
}

class _AllProductWidgetState extends ConsumerState<AllProductWidget> {
  late Future<List<ProductModel>> _productsFuture;
  @override
  void initState() {
    super.initState();
    ProductController().fetchProducts().then((products){
      ref.read(productProvider.notifier).setProduct(products);
    });
  }
  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productProvider);
    if (products.isEmpty) {
      return Center(child: CircularProgressIndicator());
    }
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductItemWidget(product: product);
        },
      ),
    );
  }
}