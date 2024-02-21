import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../constants.dart';

class aboutBody extends StatefulWidget {
  const aboutBody({super.key});

  @override
  State<aboutBody> createState() => _aboutBodyState();
}

class _aboutBodyState extends State<aboutBody> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        width > 900
            ? SizedBox(
                width: width / 5 * 2,
                height: height,
                child: Image.asset(
                  'assets/images/about page.jpg',
                  fit: BoxFit.contain,
                  width: width / 2,
                ),
              )
            : Container(),
        Expanded(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 5, right: 5),
                child: Column(
                  children: [
                    AutoSizeText(
                      "Foodie",
                      maxLines: 1,
                      style: TextStyle(
                          fontSize: 70.0,
                          fontWeight: FontWeight.w900,
                          color: kSecondaryColor),
                    ).animate().fadeIn(duration: 600.ms),
                    SizedBox(
                      height: height / 20,
                    ),
                    AutoSizeText(
                      'Welcome to Foodie - Your Virtual Culinary Haven in Veyangoda!',
                      textAlign: TextAlign.center,
                      maxLines: 7,
                      minFontSize: 10,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ).animate().fadeIn(duration: 600.ms),
                    SizedBox(
                      height: height / 20,
                    ),
                    AutoSizeText(
                      "At Foodie, we believe that great food has the power to bring people together and create unforgettable moments. Nestled in the heart of Balangoda, we're not just a restaurant; we're a culinary destination crafted with passion and innovation.",
                      maxLines: 20,
                      textAlign: TextAlign.justify,
                      minFontSize: 10,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ).animate().fadeIn(duration: 600.ms),
                    SizedBox(
                      height: height / 30,
                    ),
                    AutoSizeText(
                      'Our Story',
                      maxLines: 1,
                      minFontSize: 10,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ).animate().fadeIn(duration: 600.ms),
                    AutoSizeText(
                      "Foodie began as a dream shared by a group of food enthusiasts who wanted to revolutionize the dining experience in Balangoda. With a shared love for flavor, authenticity, and community, we set out on a journey to create something extraordinary.",
                      minFontSize: 10,
                      maxLines: 20,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ).animate().fadeIn(duration: 600.ms),
                    SizedBox(
                      height: height / 30,
                    ),
                    AutoSizeText(
                      'Our Menu',
                      maxLines: 1,
                      minFontSize: 10,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ).animate().fadeIn(duration: 600.ms),
                    AutoSizeText(
                      "Our menu is a celebration of global flavors with a local twist. Whether you're craving traditional Sri Lankan favorites, indulgent comfort food, or exotic international cuisine, our chefs have crafted a diverse selection sure to tantalize your taste buds.",
                      minFontSize: 10,
                      maxLines: 20,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ).animate().fadeIn(duration: 600.ms),
                    SizedBox(
                      height: height / 30,
                    ),
                    AutoSizeText(
                      'Join Us',
                      maxLines: 1,
                      minFontSize: 10,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ).animate().fadeIn(duration: 600.ms),
                    AutoSizeText(
                      "Whether you're a seasoned foodie or simply looking for a delicious meal in a welcoming environment, we invite you to join us at Foodie. Come savor the flavors, share stories, and create memories that will last a lifetime. Welcome to our table – where every meal is an adventure!",
                      minFontSize: 10,
                      maxLines: 20,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ).animate().fadeIn(duration: 600.ms),
                    SizedBox(
                      height: height / 30,
                    ),
                    AutoSizeText(
                      "Eat today... Live another day..",
                      maxLines: 1,
                      minFontSize: 10,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ).animate().fadeIn(duration: 600.ms),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
