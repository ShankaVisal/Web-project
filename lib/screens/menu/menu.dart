import 'package:flutter/material.dart';
import 'package:untitled3/screens/menu/components/menu_name.dart';
import 'package:untitled3/screens/menu/components/menu_header.dart';
import 'package:untitled3/screens/menu/components/tabs.dart';
import '../../constants.dart';
import '../../model.dart/product_model.dart';
import '../home/components/body.dart';
import '../home/components/footer.dart';
import '../home/components/header_container.dart';
import '../home/components/menu.dart';
import 'components/productCards.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Foodie",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w900,
                      color: kSecondaryColor),
                ),
              ),
            ),
            MobMenu()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              //header
              menuheader(),
              menuSearch(),
              SizedBox(
                height: 30,
              ),
              //ProductCard(),
              tabs(),
              SizedBox(
                height: 30,
              ),
              Footer(),
              //now we make our website responsive
            ],
          ),
        ),),
    );
  }
}
