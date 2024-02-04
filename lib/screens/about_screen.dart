import 'package:flutter/material.dart';

class about_screen extends StatefulWidget {
  const about_screen({super.key});

  @override
  State<about_screen> createState() => _about_screenState();
}

class _about_screenState extends State<about_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("About page")
          ],
        ),
      ),
    );
  }
}
