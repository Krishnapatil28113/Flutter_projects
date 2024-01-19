import 'package:flutter/material.dart';
import 'package:listview/my_list_view_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final List events = [
      'event1',
      'event2',
      'event3',
      'event4',
      'event5',
      'event6',
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              return MyListViewCard(text: events[index], length: events.length);
            },
          ),
        ),
      ),
    );
  }
}
