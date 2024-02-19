import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/screens/about/about_screen.dart';
import 'package:untitled3/screens/menu/menu.dart';
import 'package:untitled3/screens/about/components/about_body.dart';
import 'package:untitled3/screens/home/home_screen.dart';
import 'package:untitled3/screens/login/login_screen.dart';

import '../../../MyGlobals.dart';
import '../../../constants.dart';

class HeaderWebMenu extends StatefulWidget {
  const HeaderWebMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<HeaderWebMenu> createState() => _HeaderWebMenuState();
}

class _HeaderWebMenuState extends State<HeaderWebMenu> {
  @override
  Widget build(BuildContext context) {
    bool currentAccountState = MyGlobals().log_account;
    String account_log = '';
    if (currentAccountState == false) {
      account_log = 'Sign In & Sign Up';
    } else {
      account_log = 'Sign Out';
    }
    Future<void> _signOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      // You can use Navigator.pushReplacement or other navigation methods.
    }

    return Row(
      children: [
        HeaderMenu(
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          title: "Home",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> menu()));
          },
          title: "Menu",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "Offers",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            if (currentAccountState == false) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => login_screen()));
            } else {
              _signOut();
              try {
                MyGlobals().log_account = false;
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("$e")));
              }
            }
          },
          title: account_log,
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => aboutScreen()));
          },
          title: "About",
        ),
      ],
    );
  }
}

class MobFooterMenu extends StatelessWidget {
  const MobFooterMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool currentAccountState = MyGlobals().log_account;
    String account_log = '';
    if (currentAccountState == false) {
      account_log = 'Sign In & Sign Out';
    } else {
      account_log = 'Sign out';
    }
    Future<void> _signOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      // You can use Navigator.pushReplacement or other navigation methods.
    }

    return Wrap(
      children: [
        HeaderMenu(
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          title: "Home",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=> menu()));
          },
          title: "Menu",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {},
          title: "Offers",
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            if (currentAccountState == false) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => login_screen()));
            } else {
              _signOut();
              try {
                MyGlobals().log_account = false;
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text("$e")));
              }
            }
          },
          title: account_log,
        ),
        SizedBox(
          width: kPadding,
        ),
        HeaderMenu(
          press: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => aboutScreen()));
          },
          title: "About",
        ),
      ],
    );
  }
}

class HeaderMenu extends StatelessWidget {
  const HeaderMenu({
    Key? key,
    required this.title,
    required this.press,
  }) : super(key: key);
  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}

class MobMenu extends StatefulWidget {
  const MobMenu({Key? key}) : super(key: key);

  @override
  _MobMenuState createState() => _MobMenuState();
}

class _MobMenuState extends State<MobMenu> {
  @override
  Widget build(BuildContext context) {
    bool currentAccountState = MyGlobals().log_account;
    String account_log = '';
    if (currentAccountState == false) {
      account_log = 'Sign In & Sign Up';
    } else {
      account_log = 'Sign Out';
    }
    Future<void> _signOut() async {
      await FirebaseAuth.instance.signOut();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
      // You can use Navigator.pushReplacement or other navigation methods.
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderMenu(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              title: "Home",
            ),
            SizedBox(
              width: kPadding,
            ),
            HeaderMenu(
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> menu()));
              },
              title: "Menu",
            ),
            SizedBox(
              width: kPadding,
            ),
            HeaderMenu(
              press: () {},
              title: "Offers",
            ),
            SizedBox(
              width: kPadding,
            ),
            HeaderMenu(
              press: () {
                if (currentAccountState == false) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login_screen()));
                } else {
                  _signOut();
                  try {
                    MyGlobals().log_account = false;
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("$e")));
                  }
                }
              },
              title: account_log,
            ),
            SizedBox(
              width: kPadding,
            ),
            HeaderMenu(
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => aboutScreen()));
              },
              title: "About",
            ),
          ],
        ),
      ),
    );
  }
}
