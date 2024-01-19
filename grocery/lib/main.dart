import 'package:flutter/material.dart';
import 'package:grocery/features/cart/ui/cart.dart';
import 'package:grocery/features/home/ui/home.dart';
import 'package:grocery/features/wishlist/ui/wishlist.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      routes: {
        'wishlist':(context) => WishList(),
        'cart':(context) => Cart()
      },
      theme: ThemeData.light(),
    );
  }
}