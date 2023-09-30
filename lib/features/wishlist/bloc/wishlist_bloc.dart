import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_app/data/wishlist_items_data.dart';
import 'package:grocery_app/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(wishlistInitialEvent);
    on<WishlistRemoveFromListEvent>(wishlistRemoveFromListEvent);
  }

  FutureOr<void> wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    if (wishlistItems.isEmpty) {
      emit(WishlistEmptyState());
    } else {
      emit(WishlistSuccessState(wishlistItems: wishlistItems));
    }
  }

  FutureOr<void> wishlistRemoveFromListEvent(
      WishlistRemoveFromListEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.dataModel);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }
}
