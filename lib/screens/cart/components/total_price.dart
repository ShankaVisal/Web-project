import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class totalPrice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? uid = FirebaseAuth.instance.currentUser?.uid;

    if (uid != null) {
      return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Shopping Cart')
            .doc(uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Loading indicator while fetching data
          }

          if (!snapshot.hasData) {
            return Text('No data available'); // Handle case where data is not available
          }

          var cartSnapshot = snapshot.data!;
          List<dynamic> items = cartSnapshot.get('items');
          int total = items.isNotEmpty ? items[0]['total'] : 0;
          int numberOfProducts = items.isNotEmpty ? items[0]['no_of_products'] : 0;

          return total > 0
              ? SizedBox(
            height: MediaQuery.of(context).size.width < 900 ? 75 : 100,
            width: MediaQuery.of(context).size.width < 900 ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width / 2,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 25, left: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Number of Products",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                        ),
                        Text(
                          numberOfProducts.toString(),
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                        ),
                        Text(
                          'Rs. $total.00',
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 25),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
              : Container();
        },
      );
    } else {
      return Container(); // Handle case where uid is null
    }
  }
}
