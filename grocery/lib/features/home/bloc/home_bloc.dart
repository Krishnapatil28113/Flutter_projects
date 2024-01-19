import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:grocery/data/cart_items.dart';
import 'package:grocery/data/grocery_data.dart';
import 'package:grocery/data/wishlist_items.dart';
import 'package:grocery/features/home/models/home_product_data_model.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeProductWishlistNavigateEvent>(homeProductWishlistNavigateEvent);
    on<HomeProductCartNavigateEvent>(homeProductCartNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(HomeLoadingSuccessState(
      GroceryData.groceryItems.map((e) => ProductDataModel(
            e['id'],
            e['name'],
            e['description'],
            e['prices'],
            e['imageUrl'],),).toList()));
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event, Emitter<HomeState> emit) {
        print('Wishlist Button clicked');
        wishlistItems.add(event.clickedProduct);
        emit(HomeProductWishlistedActionState());
      }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeState> emit) {
        print('Cart Button clicked');
        cartItems.add(event.clickedProduct);
        emit(HomeProductCartedActionState());
      }

  FutureOr<void> homeProductWishlistNavigateEvent(
      HomeProductWishlistNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToWishlistPageActionState());
  }

  FutureOr<void> homeProductCartNavigateEvent(
      HomeProductCartNavigateEvent event, Emitter<HomeState> emit) {
    emit(HomeNavigateToCartPageActionState());
  }

  
}
