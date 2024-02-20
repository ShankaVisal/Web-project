import 'package:flutter/material.dart';

import '../../constants.dart';
import '../home/components/footer.dart';
import '../home/components/menu.dart';
import '../menu/components/menu_header.dart';
import 'components/whats_new_body.dart';



class whatsNewScreen extends StatefulWidget {
  const whatsNewScreen({super.key});

  @override
  State<whatsNewScreen> createState() => _whatsNewScreenState();
}

class _whatsNewScreenState extends State<whatsNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Foodie",
                  style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w900,
                      color: kSecondaryColor),
                ),
              ),
            ),
            MobMenu()
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              menuheader(),
              whatsNewBody(),
              SizedBox(
                height: 30,
              ),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}


