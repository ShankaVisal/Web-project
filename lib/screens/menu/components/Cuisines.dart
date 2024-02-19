
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class cuisinesFoods extends StatefulWidget {
  final String docid;
  cuisinesFoods({required this.docid});

  @override
  State<cuisinesFoods> createState() => _cuisinesFoodsState();
}

class _cuisinesFoodsState extends State<cuisinesFoods> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('cuisines')
          .doc(widget.docid)
          .snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: Text("Loading"),
          );
        }

        if (!snapshot.hasData || snapshot.data!.data() == null) {
          return Text('No data');
        }

        final productDetails = snapshot.data!.data() as Map<String, dynamic>;

        return SingleChildScrollView(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: height / 7 * 2,
                      width: 300,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage(productDetails['image']),
                                fit: BoxFit.cover)
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height/7 * 2,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              productDetails['title'], // You can add any overlay content here
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(

                ),
                Text(productDetails['title'],
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                RatingBarIndicator(
                  itemBuilder: (context, index)=> Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  rating: productDetails['rating'],
                  itemCount: 5,
                  itemSize: 30,


                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Rs. '+productDetails['price'].toString()+'/='),
                    TextButton(
                      onPressed: () {
                        _showDetailsDialog(context, productDetails['title'], productDetails['details']);
                      },
                      child: Text("See Details"),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return Colors.transparent; // Set overlay color to transparent
                          },
                        ),
                        mouseCursor: MaterialStateProperty.resolveWith<MouseCursor>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.hovered)) {
                              return SystemMouseCursors.click; // Set cursor to basic when hovered
                            }
                            return SystemMouseCursors.basic;; // Use default cursor
                          },
                        ),
                      ),
                    )
                  ],
                ),
                Container(),
                OutlinedButton(
                  onPressed: () async {
                    String? uid = FirebaseAuth.instance.currentUser?.uid;

                    DocumentReference cartRef = FirebaseFirestore.instance.collection('Shopping Cart').doc(uid);

                    // Get the current items in the shopping cart
                    DocumentSnapshot cartSnapshot = await cartRef.get();
                    List<dynamic> currentItems = cartSnapshot.get('items');

                    // Add the new product to the list of items
                    currentItems.add({
                      'name': productDetails['title'],
                      'price': productDetails['price'],
                    });

                    // Update the Firestore document with the updated list of items
                    await cartRef.update({'items': currentItems});
                    try {
                      String? uid = FirebaseAuth.instance.currentUser?.uid;

                      DocumentReference cartRef = await FirebaseFirestore.instance.collection('Shopping Cart').doc(uid);

                      // Retrieve the current items array
                      DocumentSnapshot cartSnapshot = await cartRef.get();
                      List<dynamic> items = cartSnapshot.get('items');

                      // Modify the first element of the array (assuming it exists)
                      if (items.isNotEmpty) {
                        items[0]['total'] += productDetails['price']; // Update the total

                        // Update the document with the modified items array
                        await cartRef.update({'items': items});
                      } else {
                        // Handle case where items array is empty
                      }
                    } catch (error) {
                      // Handle error
                    }
                  },
                  child: Text('Add to Cart'),
                )

                // SizedBox(height: height/25,)
              ],
            ),
          ),
        );
      },

    );
  }
  void _showDetailsDialog(BuildContext context, String productName, String productDetails) {
    double height1 = MediaQuery.of(context).size.height;
    double width1 = MediaQuery.of(context).size.width;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          content: Container(
            width: width1<600 ? width1/2 : width1/3,
            height: width1<1000 ? height1/1.2: height1/2,
            child: AlertDialog(
              title: Text('$productName',style: TextStyle(fontWeight: FontWeight.w600),),
              content: Text('$productDetails'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}