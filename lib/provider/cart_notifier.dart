import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/models/cart_model.dart';

class CartNotifier extends Notifier<Map<String, CartModel>>{
  @override
  Map<String, CartModel> build() {
    return {};
  }

  void addProduct(CartModel model) {
    if (state.containsKey(model.id)) {
      incrementQuantity(model.id);
    } else {
      state = {
        ...state,
        model.id: model,
      };
    }
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

  void decrementQuantity(String id) {
    if (state.containsKey(id)) {
      final item = state[id]!;
      if (item.quantity > 1) {
        state = {
          ...state,
          id: CartModel(
            id: item.id,
            productName: item.productName,
            category: item.category,
            productPrice: item.productPrice,
            imageUrl: item.imageUrl,
            description: item.description,
            quantity: item.quantity - 1,
          ),
        };
      } else {
        removeProduct(id);
      }
    }
  }

  double get totalPrice {
    return state.values.fold(0, (total, item) => total + (item.productPrice * item.quantity));
  }
  // STEP 8: Add a getter to retrieve the current cart items
  Map<String, CartModel> get getCartItems => state;
  // END STEP 8: Add a method to clear the cart after placing an order
}

final cartProvider = NotifierProvider<CartNotifier, Map<String, CartModel>>(
  CartNotifier.new,
);