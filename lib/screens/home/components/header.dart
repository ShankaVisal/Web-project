import 'package:flutter/material.dart';
import 'package:untitled3/screens/cart/cart_screen.dart';
import 'package:untitled3/screens/cart/components/cart_items.dart';
import '/model.dart/responsive.dart';

import '../../../constants.dart';
import 'menu.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Row(
      children: [
        // it  display only on mobile and tab
        //not working

        if (!Responsive.isDesktop(context))
          Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(Icons.menu))),
        Text(
          "Foodie",
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w900,
              color: kSecondaryColor),
        ),
        Spacer(),
        //menu
        if (Responsive.isDesktop(context)) HeaderWebMenu(),
        Spacer(),
        Container(
          height: 45,
          width: 90,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> cartScreen()));
            },
            icon: Icon(Icons.shopping_bag_outlined),
            color: Colors.white,
            iconSize: 22,
          ),
        )
      ],
    );
  }
}
