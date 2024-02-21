import 'package:flutter/material.dart';

import '../../../constants.dart';

class ServicesCard extends StatelessWidget {
  const ServicesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // now we make service section attractive and good
    return Wrap(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Services(
          image: "assets/images/delivery_boy.jpg",
          title: "Fastest Delivery",
          details : "Enjoy prompt delivery of your food, ensuring your cravings are satisfied quickly and conveniently."
        ),
        Services(
          image: "assets/images/wide_variety.jpg",
          title: "Wide Variety of Culinary Delights",
          details : "Explore a diverse menu of delicious dishes, blending local flavors with global influences."
        ),
        Services(
          image: "assets/images/online_odering.jpg",
          title: "Convenient Online Ordering",
          details : "Order your favorite meals easily online, from browsing to payment, all in one seamless experience."
        ),
      ],
    );
  }
}

class Services extends StatelessWidget {
  const Services({
    Key? key,
    required this.image,
    required this.title,
    required this.details,
  }) : super(key: key);
  final String image, title,details;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kPadding),
      child: Material(

        borderRadius: BorderRadius.circular(8.0),
        child: Container(
          padding: EdgeInsets.all(kPadding / 2),
          width: 300,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2.0),
                    child: Image.asset(
                      image,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                details,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
