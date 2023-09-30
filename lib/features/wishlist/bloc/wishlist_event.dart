part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromListEvent extends WishlistEvent {
  final ProductDataModel dataModel;

  WishlistRemoveFromListEvent({required this.dataModel});
}
