import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:grocery/data/cart_items.dart';
import 'package:grocery/features/cart/bloc/cart_bloc.dart';
import 'package:grocery/features/cart/ui/cart_tile_widget.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  final CartBloc cartBloc = CartBloc();
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }
  Widget build(BuildContext context) {

    return Scaffold(
      
      appBar: AppBar(
        title: Text('My Cart'),
        backgroundColor: Colors.teal.shade600,
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,

        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => !(current is CartActionState),

        listener: (context, state) {},
        builder: (context, state) {
          switch(state.runtimeType) {

            case CartSuccessState:
            final successState = state as CartSuccessState;
            return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (context , index) {
                return CartTileWidget(
                  cartBloc: cartBloc,
                  productDataModel: successState.cartItems[index]);
              });

            default:
              return Scaffold();
          }
        },
      ),
    );
  }
}