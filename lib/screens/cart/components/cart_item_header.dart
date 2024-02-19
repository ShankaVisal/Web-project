import 'package:flutter/material.dart';

class cartItemHeader extends StatelessWidget {
  const cartItemHeader({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height / 15,
      width: width<900 ? width : width/2,

      child: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 25, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Products",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
              Text(
                "Price",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
