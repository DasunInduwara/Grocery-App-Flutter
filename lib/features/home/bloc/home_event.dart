part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductWishlistButtonClickEvent extends HomeEvent {
  final ProductDataModel productData;

  HomeProductWishlistButtonClickEvent({required this.productData});
}

class HomeProductCartButtonClickEvent extends HomeEvent {
  final ProductDataModel productData;

  HomeProductCartButtonClickEvent({required this.productData});
}

class HomeWishlistButtonNavigateEvent extends HomeEvent {}

class HomeCartButtonNavigateEvent extends HomeEvent {}
