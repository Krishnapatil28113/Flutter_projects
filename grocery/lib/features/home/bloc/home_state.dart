part of 'home_bloc.dart';

// @immutable
//for handling some changes in the ui
sealed class HomeState {}

//for handling some changes taking place when some action is happening
sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}


//build states --> change in ui,etc
class HomeLoadingState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  final List<ProductDataModel> products;

  HomeLoadingSuccessState(this.products);
}

class HomeLoadingErrorState extends HomeState {}


//Action states
class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductWishlistedActionState extends HomeActionState {}

class HomeProductCartedActionState extends HomeActionState {}