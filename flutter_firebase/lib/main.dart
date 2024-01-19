import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase_options.dart';
import 'package:flutter_firebase/screens/email_auth/login_screen.dart';
import 'package:flutter_firebase/screens/email_auth/signup_screen.dart';
import 'package:flutter_firebase/screens/home_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore firestore = await FirebaseFirestore.instance;
  // Fetches all the documents from the collection users
  //-------------------------------------------------------------------------------------
  // QuerySnapshot snapshot = await FirebaseFirestore.instance.collection("users").get();
  // for(var doc in snapshot.docs) {
  //   log(doc.data().toString());
  // }
  //-------------------------------------------------------------------------------------

  // To fetch a particular document's/user's data in the collection
  //-------------------------------------------------------------------------------------
  // DocumentSnapshot docsnap = await FirebaseFirestore.instance.collection('users').doc('kp').get();
  // log(docsnap.data().toString());
  //-------------------------------------------------------------------------------------

  // To add data in the firestore-->We need to create a map!
  //-------------------------------------------------------------------------------------
  // Map<String,dynamic> newUserData = {
  //   'name': "KrishnaPatil",
  //   'email': "email@gmail.com",
  // };
  // firestore.collection('users').add(newUserData);
  // log('New data added!');
  //-------------------------------------------------------------------------------------

  //To create a new data if it does not exist OR To update a data if it already exists!
  //-------------------------------------------------------------------------------------
  // Map<String,dynamic> newUserData = {
  //   'name': "KrishnaPatil",
  //   'email': "email@gmail.com",
  // };
  // await firestore.collection('users').doc('My-ID').set(newUserData);
  // log('New user saved OR current user updated!');
  //-------------------------------------------------------------------------------------

  // To update
  //-------------------------------------------------------------------------------------
  // await firestore.collection('users').doc('My-ID').update(
  //   {'email': 'slantcode@gmail.com',}
  // );
  // log('Current user updated!');
  //-------------------------------------------------------------------------------------

  //To delete
  // await firestore.collection('users').doc('kp').delete();
  // log('Current user deleted!');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'loginscreen':(context) => LoginScreen(),
      },
      home: (FirebaseAuth.instance.currentUser != null) ? HomeScreen() : LoginScreen(),
    );
  }
}