import 'package:flutter/material.dart';

class whatsNewBody extends StatefulWidget {
  const whatsNewBody({super.key});

  @override
  State<whatsNewBody> createState() => _whatsNewBodyState();
}

class _whatsNewBodyState extends State<whatsNewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 30,
        ),
        CustomImageBox(imagePath: "assets/images/what's new image/1.png"),
        SizedBox(
          height: 30,
        ),
        CustomImageBox(imagePath: "assets/images/what's new image/2.png"),
        SizedBox(
          height: 30,
        ),
        CustomImageBox(imagePath: "assets/images/what's new image/3.png"),
      ],
    );
  }
}

class CustomImageBox extends StatelessWidget {
  final String imagePath;

  CustomImageBox({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: width<800 ? width/800*425 : 425,
      width: width<800 ? width : 800,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(2),
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover, // Adjust the image fit as needed
          ),
        ),
      ),
    );
  }
}
