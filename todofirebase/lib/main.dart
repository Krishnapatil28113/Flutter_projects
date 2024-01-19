import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todofirebase/auth/authform.dart';
import 'package:todofirebase/auth/authscreen.dart';
import 'package:todofirebase/firebase_options.dart';
import 'package:todofirebase/screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Stream<User> getUsersStream() {
  //   return FirebaseFirestore.instance.collection('users').snapshots();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, usersnapshot) {
          if(usersnapshot.hasData) {
            return Home();
          }
          else {
            return AuthScreen();
          }
        },
      ),
    );
  }
}