import 'package:flutter/material.dart';

import '../constants.dart';

class login_screen extends StatefulWidget {
  login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  TextEditingController username = TextEditingController();

  TextEditingController password = TextEditingController();

  bool? isChecked = false;

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
                  SizedBox(
                    height: ScrernHeight / 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            // tristate: true,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                          ),
                          Text('Remember me'),
                        ],
                      ),


                      TextButton(
                          onPressed: () {}, child: Text('Forget Password')),
                    ],
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
