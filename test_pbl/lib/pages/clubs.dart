import 'package:flutter/material.dart';

class Clubs extends StatefulWidget {
  const Clubs({super.key});

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  @override
  final List<Tab> tabs = [
    Tab(text: 'Clubs'),
    Tab(text: 'My Clubs'),
  ];
  int activeCardColour = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Hello , myself krishna'),
                  Container(
                    child: Text('kfjbgsjfga'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
