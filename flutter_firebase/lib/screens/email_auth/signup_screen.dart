import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/email_auth/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  void createAccount() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String cpassword = cPasswordController.text.trim();

    if(email == "" || password == "" || cpassword == "") {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all the details!')));
    }
    else if(password != cpassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all the details correctly!')));
    }
    else {
      try {

        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User Created Succesfully!')));
        Navigator.pop(context);
        
      } on FirebaseAuthException catch(ex) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(ex.code.toString())));
      }
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create an account"),
      ),
      body: SafeArea(
        child: ListView(
          children: [

            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: "Email Address"
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: "Password"
                    ),
                  ),

                  SizedBox(height: 10,),

                  TextField(
                    controller: cPasswordController,
                    decoration: InputDecoration(
                      labelText: "Confirm Password"
                    ),
                  ),

                  SizedBox(height: 20,),

                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        createAccount();
                      });
                    },
                    color: Colors.blue,
                    child: Text("Create Account"),
                  )

                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}