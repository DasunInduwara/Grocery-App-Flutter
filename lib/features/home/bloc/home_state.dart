part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

class HomeInitialEvent extends HomeEvent {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigationToCartPageActionState extends HomeActionState {}

class HomeProductWishlistedActionState extends HomeActionState {}

class HomeProductCartAddActionState extends HomeActionState {}
