import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/features/cart/ui/cart.dart';
import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/home/models/home_product_data_model.dart';
import 'package:grocery/features/home/ui/product_tile_widget.dart';
import 'package:grocery/features/wishlist/ui/wishlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  final HomeBloc homeBloc = HomeBloc();
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.pushNamed(context, 'wishlist');
        } else if (state is HomeNavigateToCartPageActionState) {
          Navigator.pushNamed(context, 'cart');
        }
        else if(state is HomeProductCartedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Carted')));
        }
        else if(state is HomeProductWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Item Wishlisted')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeLoadingSuccessState:
          final successState = state as HomeLoadingSuccessState;

            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal.shade600,
                title: Text('Krishna\'s grocery app'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistNavigateEvent());
                      },
                      icon: Icon(Icons.favorite_border_outlined)),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartNavigateEvent());
                      },
                      icon: Icon(Icons.add_shopping_cart_rounded)),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products.length,
                itemBuilder: (context , index) {
                return ProductTileWidget(
                  homeBloc: homeBloc,
                  productDataModel: successState.products[index]);
                
              }),
            );
            case HomeLoadingErrorState:
              return Scaffold(
                body: Center(child: Text('G Marao'),),
              );
            default:
              return SizedBox();
        }
      },
    );
  }
}

// return Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.teal.shade600,
//             title: Text('Krishna\'s grocery app'),
//             actions: [
//               IconButton(onPressed: (){
//                 homeBloc.add(HomeProductWishlistNavigateEvent());
//               }, icon: Icon(Icons.favorite_border_outlined)),
//               IconButton(onPressed: (){
//                 homeBloc.add(HomeProductCartNavigateEvent());
//               }, icon: Icon(Icons.add_shopping_cart_rounded)),
//             ],
//           ),
//         );