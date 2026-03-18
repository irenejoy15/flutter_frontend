import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/product_model.dart';

class ProductNotifier extends Notifier<List<ProductModel>>{
  @override
  List<ProductModel> build() {
    return [];
  }

  void setProduct(List<ProductModel> products){
    state = products;
  }
}

final productProvider = NotifierProvider<ProductNotifier, List<ProductModel>>(() => ProductNotifier());