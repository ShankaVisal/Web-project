import 'package:flutter/material.dart';

import '../constants.dart';

class login_screen extends StatelessWidget {
  login_screen({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

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
              width: ScrernWidth/2,
            ),
          )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: ScrernWidth/15, right: ScrernWidth/15 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      'Sign in to Foodie',
                    style: TextStyle(
                       fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: username,
                    decoration: InputDecoration(
                      hintText: 'User Name',
                      labelText: 'User Name',
                    ),
                  ),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                  ),
                  SizedBox(height: ScrernHeight/25,),
                  MaterialButton(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                    minWidth: ScrernWidth,
                    height: 55,
                    color: kSecondaryColor,
                    onPressed: () {},
                    child: Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
