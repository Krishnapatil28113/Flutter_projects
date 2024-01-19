import 'package:flutter/material.dart';
import 'package:test_pbl/pages/Calender.dart';
import 'package:test_pbl/pages/homescreen.dart';
import 'package:test_pbl/pages/clubs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context) => Clubs(),
      },
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      // home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  int currentindex = 0;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (int value) => currentindex = value,
          currentIndex: currentindex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.animation_rounded,
                // size: 30.0,
              ),
              label: 'Clubs',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_to_photos_outlined,
                // size: ,
              ),
              label: 'Photos',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_alarm_rounded,
              ),
              label: 'Whats new',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: 'Profile',
            ),
          ],
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi Krishna!',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '23 Jan,2023',
                        style: TextStyle(
                          color: Colors.blue.shade200,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade600,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue.shade600,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.blue.shade100,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                        color: Colors.blue.shade100,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              ListTile(
                leading: Text(
                  'What\'s new!',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              HorizontalScrollView(),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                  // color: Colors.blue.shade600,
                     color: Colors.blueAccent.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class buildcard extends StatelessWidget {
  buildcard(this.text1, this.text2);
  
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 200.0,
      color: Colors.grey.shade300,
      child: Column(
        children: [
          Text(text1),
          Text(text2),
        ],
      ),
    );
  }
}

class HorizontalScrollView extends StatelessWidget {
  const HorizontalScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 150.0,
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blueAccent[100],
            ),
            child: Center(
              child: Text(
                'Item $index',
                style: TextStyle(fontSize: 24.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
// Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                           'PCSB',
//                           style: TextStyle(
//                           fontSize: 20.0,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.purple,
//                         ),
//                       ),
//                       Text(
//                         'Coding club 1',
//                       style: TextStyle(fontWeight: FontWeight.w500,
//                       color: Colors.purple.shade400,
//                       ),
//                     ),
//                           ],
//                         ),


