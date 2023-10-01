import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery_app/data/cart_item_data.dart';
import 'package:grocery_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<CartRemoveFromCartEvent>(cartRemoveFromCartEvent);
  }

  FutureOr<void> cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    if (cartItems.isEmpty) {
      emit(CartEmptyState());
    } else {
      double total = calculateTotal();

      emit(CartSuccessState(cartItems: cartItems, totalPrice: total));
    }
  }

  FutureOr<void> cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.dataModel);
    double total = calculateTotal();
    emit(CartSuccessState(cartItems: cartItems, totalPrice: total));
  }

  double calculateTotal() {
    double total = 0.0;
    for (var element in cartItems) {
      total = total + element.price;
    }
    return total;
  }
}
