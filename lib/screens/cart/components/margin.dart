import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/MyGlobals.dart';
import 'package:untitled3/screens/cart/components/total_price.dart';

class margin extends StatefulWidget {
  margin({super.key});

  @override
  State<margin> createState() => _marginState();
}

class _marginState extends State<margin> {
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return total > 0
        ? Container(
            height: 1,
            width: width < 900 ? width : width / 2,
            color: Colors.grey, // Set the color of the line
            margin: EdgeInsets.symmetric(vertical: 10), // Set margin if needed
          )
        : Container();
  }
}
