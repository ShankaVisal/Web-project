import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class checkoutOrRemoveProducts extends StatefulWidget {
  const checkoutOrRemoveProducts({super.key});

  @override
  State<checkoutOrRemoveProducts> createState() => _checkoutOrRemoveProductsState();
}

class _checkoutOrRemoveProductsState extends State<checkoutOrRemoveProducts> {
  int total = 0;

  @override
  void initState() {
    super.initState();
    fetchTotalAmount();
  }

  Future<void> fetchTotalAmount() async {
    try {
      String? uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid != null) {
        DocumentSnapshot cartSnapshot = await FirebaseFirestore.instance
            .collection('Shopping Cart')
            .doc(uid)
            .get();
        List<dynamic> items = cartSnapshot.get('items');
        if (items.isNotEmpty) {
          setState(() {
            total = items[0]['total'];
          });
        } else {
          // Handle case where items array is empty
        }
      } else {
        // Handle case where uid is null
      }
    } catch (error) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery
        .of(context)
        .size
        .height;
    double width = MediaQuery
        .of(context)
        .size
        .width;
    return total > 0 ? SizedBox(
      height: height / 15,
      width: width < 900 ? width : width / 2,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 25, left: 15),
          child: MaterialButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            minWidth: width < 900 ? width/1.1 : width / 3.2,
            height: 60,
            color: kSecondaryColor,
            onPressed: () {},
            child: Text(
              "CheckOut",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    )
        : Container();
  }
}
