import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/screens/cart/components/delivery.dart';
import 'package:untitled3/screens/cart/components/pickup.dart';

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
            onPressed: () {
              _foodOrderingoptions(context);
            },
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

  void _foodOrderingoptions(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
    double width1 = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          content: Container(
            width: width1<600 ? width1/1.1 : width1/2,
            height: width1<1000 ? height1/2: height1/2,
            child: AlertDialog(
              actions:[
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "What do you prefer ?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                            minWidth: width1/5*3,
                            color: kSecondaryColor,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>delivery()));
                            },
                            child: Text(
                              "Delivery",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            "or",
                            style: TextStyle(
                                color: kSecondaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          child: MaterialButton(
                            minWidth: width1/5*3,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>pickup()));
                            },
                            // color: Colors.white, // Set to transparent to have an outlined appearance
                            textColor: kSecondaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0), // Adjust the radius as needed
                              side: BorderSide(color: kSecondaryColor),
                            ),
                            child: Text(
                              "Pick Up",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ]
            ),
          ),
        );
      },
    );
  }

  void showOptions(BuildContext context) {
    double height1 = MediaQuery.of(context).size.height;
    double width1 = MediaQuery.of(context).size.width;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: height1/2,
          width: width1/2,
          // padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text(
                "What do you prefer ?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  minWidth: width1/5*2,
                  color: kSecondaryColor,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>delivery()));
                  },
                  child: Text(
                    "Delivery",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "or",
                  style: TextStyle(
                      color: kSecondaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(
                child: MaterialButton(
                  minWidth: width1/5*2,
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>pickup()));
                  },
                  // color: Colors.white, // Set to transparent to have an outlined appearance
                  textColor: kSecondaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0), // Adjust the radius as needed
                    side: BorderSide(color: kSecondaryColor),
                  ),
                  child: Text(
                    "Pick Up",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height1/5*1,
              )
            ],
          ),
        );
      },
    );
  }
}

