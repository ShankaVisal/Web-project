import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../MyGlobals.dart';
import '../../constants.dart';
import '../home/home_screen.dart';
import 'login_screen.dart';

class signUpPage extends StatefulWidget {
  const signUpPage({super.key});

  @override
  State<signUpPage> createState() => _signUpPageState();
}

class _signUpPageState extends State<signUpPage> {
  TextEditingController _user = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  TextEditingController _rePwd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double ScrernHeight = MediaQuery.of(context).size.height;
    double ScrernWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/login.png',
              fit: BoxFit.contain,
              width: ScrernWidth / 2,
            ),
          )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                  left: ScrernWidth / 15, right: ScrernWidth / 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Sign Up to Foodie',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: _user,
                    decoration: const InputDecoration(
                      hintText: 'Enter User Name',
                      labelText: 'Enter User Name',
                    ),
                  ),
                  TextField(
                    controller: _email,
                    decoration: const InputDecoration(
                      hintText: 'Enter Email',
                      labelText: 'Enter Email',
                    ),
                  ),
                  TextField(
                    controller: _pwd,
                    decoration: const InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'Enter Password',
                    ),
                  ),
                  TextField(
                    controller: _rePwd,
                    decoration: const InputDecoration(
                      hintText: 'Re enter Password',
                      labelText: 'Re enter Password',
                    ),
                  ),
                  SizedBox(
                    height: ScrernHeight / 25,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    minWidth: ScrernWidth,
                    height: 55,
                    color: kSecondaryColor,
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () async {
                      if (_email.text.isEmpty ||
                          _pwd.text.isEmpty ||
                          _rePwd.text.isEmpty ||
                          _user.text.isEmpty) {
                        // If any of the fields are empty, show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill all the fields'),
                          ),
                        );
                        return; // Exit the function if any of the fields are empty
                      }

                      if (_pwd.text != _rePwd.text) {
                        // If the passwords do not match, show an error message
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match'),
                          ),
                        );
                        return; // Exit the function if the passwords do not match
                      }

                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                          email: _email.text,
                          password: _pwd.text,
                        );
                        String? uid = FirebaseAuth.instance.currentUser?.uid;

                        DocumentReference cartRef = FirebaseFirestore.instance.collection('Shopping Cart').doc(uid);

                        await cartRef.set({
                          'items': FieldValue.arrayUnion([{
                            'name':'',
                            'price':0,
                            'total':0,
                          }
                          ])
                        });
                        // Navigate to the homePage if sign-up is successful
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()));
                        setState(() {
                          MyGlobals().log_account = true;
                          MyGlobals().total_amount = 0;
                        });
                      } catch (e) {
                        // Handle the exception/error here
                        print(
                            'Sign Up failed: $e'); // You can log the error for debugging purposes
                        // Show a snackbar, dialog, or any other UI to inform the user about the error
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Sign Up failed: $e'),
                            // You can customize the duration, behavior, and other properties of the snackbar
                          ),
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
