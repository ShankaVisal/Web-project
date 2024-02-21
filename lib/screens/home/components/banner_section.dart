import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:untitled3/screens/menu/menu.dart';

import '../../../constants.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: AboutSection(),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Image.asset("assets/images/banner.png").animate().fade().scale(),
            ],
          ),
        )
      ],
    );
  }
}

class MobBanner extends StatefulWidget {
  const MobBanner({Key? key}) : super(key: key);

  @override
  _MobBannerState createState() => _MobBannerState();
}

class _MobBannerState extends State<MobBanner> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Image.asset(
              "assets/images/banner.png",
              height: 250,
              width: 250,
            ).animate().fade().scale(),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        AboutSection(),
      ],
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        // ignore: prefer_const_constructors
        //it will adjust its size according to screeen
        AutoSizeText(
          "Eat today",
          maxLines: 1,
          style: TextStyle(fontSize: 56, fontWeight: FontWeight.bold),
        ).animate().fadeIn(duration: 600.ms), // baseline=800ms
        SizedBox(
          height: 10,
        ),
        AutoSizeText(
          "Live another day",
          maxLines: 1,
          style: TextStyle(
            fontSize: 56,
          ),
        ).animate().fadeIn(duration: 900.ms),
        SizedBox(
          height: 10,
        ),
        Text(
          "Welcome to Foodie - Your Virtual Culinary Haven in Veyangoda!",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black54,
            fontWeight: FontWeight.w600,
            fontSize: 20
          ),
        ).animate().fadeIn(duration: 900.ms),
        SizedBox(
          height: 5,
        ),
        Text(
          "Welcome to Foodie, where culinary creativity meets exceptional taste. We're not just a restaurant; we're your passport to a world of flavors right here in Balangoda. Whether you're craving a hearty Sri Lankan feast, a gourmet burger, or a tantalizing Thai curry, we've got something to satisfy every craving.",
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black,
          ),
        ).animate().fadeIn(duration: 900.ms),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.withOpacity(0.3)),
          ),
          child: TextFormField(
            decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.adjust_rounded,
                  color: kSecondaryColor,
                ),
                hintText: "Search your favourite food",
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none)),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Expanded(
              child: MaterialButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                height: 60,
                color: kSecondaryColor,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>menu()));
                },
                child: Text(
                  "Delivery",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "or",
                style: TextStyle(
                    color: kSecondaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: MaterialButton(
                height: 60,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>menu()));
                },
                // color: Colors.white, // Set to transparent to have an outlined appearance
                textColor: kSecondaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0), // Adjust the radius as needed
                  side: BorderSide(color: kSecondaryColor),
                ),
                child: Text(
                  "Pick Up",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
