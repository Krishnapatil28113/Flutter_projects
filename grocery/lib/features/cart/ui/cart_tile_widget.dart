import 'package:flutter/material.dart';
import 'package:grocery/features/cart/bloc/cart_bloc.dart';
// import 'package:grocery/features/home/bloc/home_bloc.dart';
import 'package:grocery/features/home/models/home_product_data_model.dart';

class CartTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final CartBloc cartBloc;
  const CartTileWidget({super.key, required this.productDataModel, required this.cartBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productDataModel.imageUrl)),
            ),
          ),
          const SizedBox(height: 10.0,),

          Text(productDataModel.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),),
          Text(productDataModel.description),

          const SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$' + productDataModel.prices.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
              ),
              Row(children: [
                IconButton(onPressed: (){
                  // homeBloc.add(HomeProductWishlistButtonClickedEvent(
                  //   productDataModel,
                  // ));
                }, icon: Icon(Icons.favorite_outline_rounded)),
                IconButton(onPressed: (){
                  // homeBloc.add(HomeProductCartButtonClickedEvent(
                  //   productDataModel,
                  // ));
                }, icon: Icon(Icons.add_shopping_cart_rounded)),
              ],)
            ],
          ),
        ],
      ),
    );
  }
}
