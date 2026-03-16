import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/cart_model.dart';

class CartNotifier extends Notifier<Map<String, CartModel>>{
  @override
  Map<String, CartModel> build() {
    return {};
  }

  void addProduct(CartModel model) {
    state = {
      ...state,
      model.id: model,
    };
  }

  void removeProduct(String id) {
    final newState = Map<String, CartModel>.from(state);
    newState.remove(id);
    state = newState;
  }

  void incrementQuantity(String id) {
    if (state.containsKey(id)) {
      final item = state[id]!;
      state = {
        ...state,
        id: CartModel(
          id: item.id,
          productName: item.productName,
          category: item.category,
          productPrice: item.productPrice,
          imageUrl: item.imageUrl,
          description: item.description,
          quantity: item.quantity + 1,
        ),
      };
    }
  }
}

final cartProvider = NotifierProvider<CartNotifier, Map<String, CartModel>>(
  CartNotifier.new,
);