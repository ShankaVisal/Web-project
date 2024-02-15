import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../../model.dart/product_model.dart';

import '../../home/components/body.dart';
import '../../home/components/product.dart';

class menuDesktopSize extends StatefulWidget {
  const menuDesktopSize({super.key});

  @override
  State<menuDesktopSize> createState() => _menuDesktopSizeState();
}

class _menuDesktopSizeState extends State<menuDesktopSize> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [

      ],
    );
  }
}

class menuMobileSize extends StatefulWidget {
  const menuMobileSize({super.key});

  @override
  State<menuMobileSize> createState() => _menuMobileSizeState();
}

class _menuMobileSizeState extends State<menuMobileSize> {
  @override
  Widget build(BuildContext context) {
    return Column(

    );
  }
}

