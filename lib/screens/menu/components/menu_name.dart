import 'package:flutter/material.dart';

class menuSearch extends StatelessWidget {
  const menuSearch({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        child: Column(

          children: [
            Stack(
              children: [
                SizedBox(
                  height: height / 7 * 3,
                  width: width,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/menuheader.png"),
                            fit: BoxFit.cover)
                    ),
                  ),
                ),
                SizedBox(
                  height: height/7 * 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          'Menu', // You can add any overlay content here
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
