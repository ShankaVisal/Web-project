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
  late List<dynamic> currentItems = [];
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

  Future<void> removeItem(int index) async {
    String? uid = FirebaseAuth.instance.currentUser?.uid;
    DocumentReference cartRef =
        FirebaseFirestore.instance.collection('Shopping Cart').doc(uid);

    List<dynamic> updatedItems = List.from(currentItems);
    int removedPrice = currentItems[index + 1]['price'];
    currentItems[0]['total'] -= removedPrice;
    currentItems[0]['no_of_products'] -= 1;
    updatedItems.removeAt(index + 1); // Remove the item at the given index

    await cartRef.update(
        {'items': updatedItems}); // Update Firestore with the updated items
    setState(() {
      currentItems =
          updatedItems; // Update the local state with the updated items
    });
  }

  void calTotal() {
    for (var item in currentItems) {
      total += int.parse(item['price'].toString());
    }
    setState(() {
      print(total);
    });
    // updateTotalPrice(total);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: SizedBox(
        height: width< 900 ? height/3 :height/3*2,
        width: width < 900 ? width : width / 2,
        child: currentItems.isNotEmpty
            ? ListView.builder(
                itemCount: currentItems.length - 1,
                itemBuilder: (context, index) {
                  final adjustedIndex = index + 1;
                  return ListTile(
                    title: SingleChildScrollView(
                      child: SizedBox(
                        height: 150,
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 150,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(15),
                                          child: Image.asset(
                                            currentItems[adjustedIndex]['image'].toString(),
                                            fit: BoxFit.cover, // Adjust the image fit as needed
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(' '+currentItems[adjustedIndex]['name'].toString()),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Text('Rs. ' +currentItems[adjustedIndex]['price'].toString() +'.00'),
                                    IconButton(
                                      icon: Icon(Icons.remove_circle_outline),
                                      onPressed: () {
                                        removeItem(index); // Call removeItem function with the index of the item to remove
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // Other item UI goes here
                  );
                },
              )
            : Center(
                child: Text('No Any products yet')),
      ),
    );
  }
}
