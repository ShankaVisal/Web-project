import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/screens/home/home_screen.dart';
import 'package:untitled3/screens/login/signup_screen.dart';

import '../../MyGlobals.dart';
import '../../constants.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSavedCredentials();
  }

  void loadSavedCredentials() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isChecked = prefs.getBool('rememberMe') ?? false;
      if(isChecked!){
        username.text = prefs.getString('username') ?? '';
        password.text = prefs.getString('password') ?? '';
      }
    });
  }

  void saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', isChecked!);
    if(isChecked!){
      prefs.setString('username', username.text);
      prefs.setString('password', password.text);
    }
  }

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
                    'Sign in to Foodie',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextField(
                    controller: username,
                    decoration: const InputDecoration(
                      hintText: 'User Name',
                      labelText: 'User Name',
                    ),
                  ),
                  TextField(
                    controller: password,
                    decoration: const InputDecoration(
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
                          const Text('Remember me'),
                        ],
                      ),
                      TextButton(
                          onPressed: () {}, child: const Text('Forget Password')),
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
                    onPressed: () async {
                      if (username.text.isEmpty || password.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Please Fill the all the feilds'),
                        ));
                        return;
                      }
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: username.text, password: password.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                        setState(() {
                          MyGlobals().log_account = true;
                          saveCredentials();
                        });
                      } catch (e) {
                        print('Login failed: $e');
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login failed: $e")));
                        MyGlobals().total_amount = 0;
                      }
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),                  SizedBox(
                    height: ScrernHeight / 50,
                  ),
                  const Text('Or login with'),
                  SizedBox(
                    height: ScrernHeight / 50,
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    minWidth: ScrernWidth,
                    height: 55,
                    color: Colors.white,
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(
                          "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAcCAMAAABF0y+mAAAAzFBMVEVHcEz////////+/v77+/vx8fL9/f309fX+/v739/f////09PXOz8/5+vr8/P3////////29vf///////84qlf8wAdGiPX8/PzsUUTqQjQsqFLrSj3S3/w6g/TqPCs0gPQgpUf85+bv9P+63sL62Nb+8ef4ycbw+PJkunkeePP81HXwgGv0jhzc5/3o9efX7N5Fr19Uj/WQy562zPr2trL94KDzoJrzoJv80Gjyl5H94qgyh9v7xzihsSp+wYV1sE5ZtXBmmvUynoWKrvzKDGT6AAAAE3RSTlMAW+TTeBLcHLMt1WsKzfUznkBIxSDAuAAAAUZJREFUKJFtktligkAMRUFZxKVuDMOAggpu1apVu+/t//9TkxBU1PsySQ4hlyGadpTd0fWOrV2R3eqyWhe80j1RpYCc7pmcI2tyaZimQw6bOTMplU9hpKIofJSUmgwtTCYq9EFhqKIJ5lbGdGIRAGhUQLNX6wRLOA2Y8vdpuvfVOJtaOjhdhL56yYrjU8cGFsRSLc4/x+DPfxBiSZN6LMlXUYXzVghBT8/7pPkdxFX28yzEO8HYI8U9dlQudMZx3AeInWWe+SrExxrhCLTre3E+M3P7FXznLn887z53a2PwGbjBLLvUP2jcYUC/FYdOA9d1g22SbN1fbizT9bUxXA+QguB4G2GlfbIFqw1i0GCzKmzDDQ1LZgPQLKHk5rAJpmSj0ykH0jxArW4V79yqF1bMkEckjYvFrTWIy0btApFsx7m68Ff1D4OdMHbngtKsAAAAAElFTkSuQmCC",
                          fit: BoxFit.scaleDown,
                        ),
                        const Text("Google"),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ScrernHeight / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text('Don’t have an account?'),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>signUpPage()));
                          },
                          child: const Text(
                              'Sign Up now',
                            style: TextStyle(
                              color: kSecondaryColor,
                              fontWeight: FontWeight.w600
                            ),
                          )
                      ),

                    ],
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


