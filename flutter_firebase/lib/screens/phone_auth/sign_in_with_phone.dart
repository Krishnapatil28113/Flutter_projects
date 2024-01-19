import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({super.key});

  @override
  State<SignInWithPhone> createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {

  void sendOTP() async {
    
  }

  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sign In with Phone"),
      ),
      body: SafeArea(
        child: ListView(
          children: [

            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  
                  TextField(
                    controller: phoneController,
                    decoration: InputDecoration(
                      labelText: "Phone Number"
                    ),
                  ),

                  SizedBox(height: 20,),

                  CupertinoButton(
                    onPressed: () {
                      sendOTP();
                    },
                    color: Colors.blue,
                    child: Text("Sign In"),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );;
  }
}