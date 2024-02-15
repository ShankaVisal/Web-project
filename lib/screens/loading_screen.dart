import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:untitled3/screens/home/home_screen.dart';

class loading_screen extends StatefulWidget {
  const loading_screen({super.key});

  @override
  State<loading_screen> createState() => _loading_screenState();
}

class _loading_screenState extends State<loading_screen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    double ScrernHeight = MediaQuery.of(context).size.height;
    double ScrernWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: ScrernHeight/2,
              width: ScrernWidth/2,
              child: Lottie.network(
                  'https://lottie.host/61195d0a-6206-4cb1-a916-b1462814e3e3/Ni2LsX34Dj.json'),
            ),
          ],
        ),
      ),
    );
  }
}
