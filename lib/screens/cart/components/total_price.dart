import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/MyGlobals.dart';

class totalPrice extends StatefulWidget {
  totalPrice({Key? key}) : super(key: key);

  @override
  State<totalPrice> createState() => _totalPriceState();
}

class _totalPriceState extends State<totalPrice> {
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
    return SizedBox(
      height: height / 15,
      width: width < 900 ? width : width / 2,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(right: 25, left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
              Text(
                total.toString(),
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
