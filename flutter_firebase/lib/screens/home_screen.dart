import 'dart:developer';
import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/email_auth/login_screen.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  void saveUser() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    String ageString = ageController.text.trim();

    int age = int.parse(ageString);


    nameController.clear();
    emailController.clear();
    ageController.clear();

    if(name != '' && email != '' && age != 0) {
      Map<String,dynamic> newUserData = {
        'name': name,
        'email': email,
        'age': age
      };
      FirebaseFirestore.instance.collection('users').add(newUserData);
      log('New User Saved!');
    }
    else {
      log('Invalid name or email!');
    }
  }

  void deleteUser(dynamic docId) async {
    await FirebaseFirestore.instance.collection('users').doc(docId).delete();
    log('User Deleted!');
  }

  void logout() async {
    //This will update the information that the user which is registered has signed out!
    FirebaseAuth.instance.signOut();
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                logout();
              },
              icon: Icon(Icons.exit_to_app),
            ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [

              CupertinoButton(
                onPressed: () async {
                  XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

                  if(selectedImage != null) {
                    
                  }
                },
                child: CircleAvatar(
                  radius: 70.0,
                  
                ),
              ),
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  labelText: 'Enter name',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Enter email',
                ),
              ),

              SizedBox(
                height: 20,
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(
                  labelText: 'Enter age',
                ),
              ),

              CupertinoButton(
                  child: Text("Save"),
                  onPressed: (){
                  saveUser();
                },
              ),

              StreamBuilder<QuerySnapshot> (
                stream: FirebaseFirestore.instance.collection("users").snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> userData =
                              snapshot.data!.docs[index].data()
                                  as Map<String, dynamic>;

                          return ListTile(
                            title: Text(userData['name'] + '(${userData['age']})'),
                            subtitle: Text(userData['email']),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: (){
                                deleteUser(snapshot.data!.docs[index].id);
                              },
                            ),
                          );
                        },
                      );
                    } else {
                      return Text('Snapshot doesn\'t contains any data!');
                    }
                  }
                  else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}