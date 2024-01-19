import 'package:flutter/material.dart';
import 'package:flutterweb/widgets/navigationbar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        children: [
          Navigationbar(),
        ],
      ),
    );
  }
}