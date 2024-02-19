import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:untitled3/MyGlobals.dart';
import 'package:untitled3/screens/cart/components/total_price.dart';

class cartItems extends StatefulWidget {
  const cartItems({Key? key}) : super(key: key);

  @override
  State<cartItems> createState() => _cartItemsState();
}

class _cartItemsState extends State<cartItems> {
  late List<dynamic> currentItems= [];
  int total = 0;

  @override
  void initState() {
    super.initState();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    DocumentReference cartRef =
    FirebaseFirestore.instance.collection('Shopping Cart').doc(uid);
    DocumentSnapshot cartSnapshot = await cartRef.get();
    setState(() {
      currentItems = cartSnapshot.get('items');
    });
    calTotal();
  }

  void calTotal(){
    for(var item in currentItems){
      total += int.parse(item['price'].toString());
    }
    setState(() {
      print(total);
      MyGlobals().total_amount = total;
      print(MyGlobals().total_amount);
    });
    // updateTotalPrice(total);
  }

  // Future<void> updateTotalPrice(int totalPrice) async {
  //   try {
  //     String? uid = FirebaseAuth.instance.currentUser?.uid;
  //
  //     DocumentReference cartRef = await FirebaseFirestore.instance.collection('Shopping Cart').doc(uid);
  //
  //     // Retrieve the current items array
  //     DocumentSnapshot cartSnapshot = await cartRef.get();
  //     List<dynamic> items = cartSnapshot.get('items');
  //
  //     // Modify the first element of the array (assuming it exists)
  //     if (items.isNotEmpty) {
  //       items[0]['total'] = total; // Update the total
  //
  //       // Update the document with the modified items array
  //       await cartRef.update({'items': items});
  //     } else {
  //       // Handle case where items array is empty
  //     }
  //   } catch (error) {
  //     // Handle error
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SizedBox(
        height: height/10*5,
        width: width<900 ? width : width/2,
        child:  Center(
            child: currentItems.isNotEmpty
                ? ListView.builder(
              itemCount: currentItems.length-1,
              itemBuilder: (context, index) {
                final adjustedIndex = index + 1;
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(currentItems[adjustedIndex]['name'].toString()),
                      Text('Rs. '+currentItems[adjustedIndex]['price'].toString()+'.00')
                    ],
                  ),
                  // Other item UI goes here
                );
              },
            )
                : Center(child: Text('No Any products yet')), // Show loading indicator while fetching data
          ),

      ),
    );
  }
}
