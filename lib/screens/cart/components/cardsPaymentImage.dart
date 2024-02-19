import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class cardsPayementImage extends StatefulWidget {
  const cardsPayementImage({super.key});

  @override
  State<cardsPayementImage> createState() => _cardsPayementImageState();
}

class _cardsPayementImageState extends State<cardsPayementImage> {
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
    return total > 0
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/images/creditCards.png',
                fit: BoxFit.cover, // Adjust the image fit as needed
              ),
            ),
          )
        : Container();
  }
}
