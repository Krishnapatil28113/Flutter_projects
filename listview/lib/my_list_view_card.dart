import 'package:flutter/material.dart';

class MyListViewCard extends StatefulWidget {
  const MyListViewCard({super.key, required this.text, required this.length});

  final String text;
  final int length;
  @override
  State<MyListViewCard> createState() => _MyListViewCardState();
}

class _MyListViewCardState extends State<MyListViewCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.only(left: 15),
          margin: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade500.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ]),
          child: Text(widget.text),
        ),
      ),
    );
  }
}
