import 'package:flutter/material.dart';
import 'package:untitled3/MyGlobals.dart';
import 'package:untitled3/screens/cart/components/cardsPaymentImage.dart';
import 'package:untitled3/screens/cart/components/cart_item_header.dart';
import 'package:untitled3/screens/cart/components/cart_items.dart';
import 'package:untitled3/screens/cart/components/checkout%20_clear%20items.dart';
import 'package:untitled3/screens/cart/components/margin.dart';
import 'package:untitled3/screens/cart/components/total_price.dart';
import 'package:untitled3/screens/menu/components/menu_header.dart';

import '../../constants.dart';
import '../home/components/footer.dart';
import '../home/components/menu.dart';

class cartScreen extends StatefulWidget {
  const cartScreen({super.key});

  @override
  State<cartScreen> createState() => _cartScreenState();
}

class _cartScreenState extends State<cartScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
        body: width < 900
            ? SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      menuheader(),
                      SizedBox(
                        height: height / 30,
                      ),
                      cartItemHeader(),
                      margin(),
                      SizedBox(
                        height: height / 30,
                      ),
                      cartItems(),
                      SizedBox(
                        height: height / 30,
                      ),
                      margin(),
                      totalPrice(),
                      margin(),
                      checkoutOrRemoveProducts(),
                      SizedBox(
                        height: height / 30,
                      ),
                      Footer(),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                child: SafeArea(
                  child: Column(
                    children: [
                      menuheader(),
                      SizedBox(
                        height: height / 30,
                      ),
                      Row(
                        children: [
                          Container(
                            width: width/3*2,
                            child: Column(
                              children: [
                                cartItemHeader(),
                                margin(),
                                SizedBox(
                                  height: height / 30,
                                ),
                                cartItems(),
                              ],
                            ),
                          ),
                          Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                    child: Column(
                                      children: [
                                        totalPrice(),
                                        margin(),
                                        checkoutOrRemoveProducts(),
                                        SizedBox(
                                          height: height / 30,
                                        ),
                                        cardsPayementImage(),
                                      ],
                                    ),
                                  )
                                ],
                              )
                          )
                        ],
                      ),
                      Footer(),
                    ],
                  ),
                ),
              ));
  }
}
