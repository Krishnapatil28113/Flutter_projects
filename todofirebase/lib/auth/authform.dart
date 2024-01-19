import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  //-------------------------------------
  final _formkey = GlobalKey<FormState>();
  var _email = '';
  var _password = '';
  var _username = '';
  bool isLoginPage = false;
  //-------------------------------------

  startauthentication() {
    final validity = _formkey.currentState!.validate();
    Focus.of(context).unfocus();

    if(validity) {
      _formkey.currentState!.save();
      submitform(_email , _password , _username);
    }
  }

  submitform(String _email , String _password , String _username) async{
    final _auth = FirebaseAuth.instance;
    UserCredential userCredential;

    try {
      if(!isLoginPage) {
        userCredential = await _auth.signInWithEmailAndPassword(email: _email, password: _password);
      }
      else {
        userCredential = await _auth.createUserWithEmailAndPassword(email: _email, password: _password);
        String uid = _auth.currentUser!.uid;
        await FirebaseFirestore.instance.collection('users').doc(uid).set({
          'username': _username,
          'email': _email
        });
      }
    } catch (e) {
      print(e);
    }

  }

  //-------------------------------------

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.height,
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
            child: Form(
              key: _formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                  if(!isLoginPage)
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey('username'),
                    validator: (value) {
                      // if (value != null) {
                        if (value!.isEmpty) {
                           return 'Incorrect Username';
                        }
                        return null;
                      // }
                    },

                    onSaved: (newValue) {
                      if (newValue != null) {
                        _username = newValue;
                      }
                    },
                    
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Enter Username',
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey('email'),
                    // validator: (value) {
                    //   if (value != null) {
                    //     if (value.isEmpty || !value.contains('@')) {
                    //       return 'Incorrect email';
                    //     }
                    //     return null;
                    //   }
                    // },

                    onSaved: (newValue) {
                      if (newValue != null) {
                        _email = newValue;
                      }
                    },

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Enter email',
                    ),
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: ValueKey('password'),
                    // validator: (value) {
                    //   if (value != null) {
                    //     if (value.isEmpty) {
                    //       return 'Incorrect password';
                    //     }
                    //     return null;
                    //   }
                    // },

                    onSaved: (newValue) {
                      if (newValue != null) {
                        _password = newValue;
                      }
                    },

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Enter password',
                    ),
                  ),

                  SizedBox(
                    height: 30.0,
                  ),

                  Container(
                    width: double.infinity,
                    height: 70.0,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          startauthentication();
                        });
                      },
                      child: isLoginPage ? Text('Login') : Text('Sign Up'),
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          isLoginPage = !isLoginPage;
                          startauthentication();
                        });
                      },
                      child: !isLoginPage? Text('Already a member?') : Text('Not a member?'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
