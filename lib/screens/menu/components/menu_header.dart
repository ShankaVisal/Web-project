import 'package:flutter/material.dart';
import 'package:untitled3/screens/menu/components/menu_body.dart';
import '../../home/components/header.dart';
import '/model.dart/responsive.dart';
import '../../../../constants.dart';


class menuheader extends StatelessWidget {
  const menuheader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: kPrimaryColor,
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(kPadding),
            constraints: BoxConstraints(maxWidth: kMaxWidth),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Header(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
