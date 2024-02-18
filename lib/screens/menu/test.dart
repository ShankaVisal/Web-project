import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class productitems extends StatefulWidget {
  final String docid;
  productitems({required this.docid});

  @override
  State<productitems> createState() => _productitemsState();
}

class _productitemsState extends State<productitems> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('product')
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
                Text(productDetails['title']),
                RatingBarIndicator(
                  itemBuilder: (context, index)=> Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  rating: productDetails['rating'],
                  itemCount: 5,
                  itemSize: width/40,


                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(productDetails['price']),
                    TextButton(onPressed: (){_showDetailsDialog(context, productDetails['title'], productDetails['details']);}, child: Text("See Details"))
                  ],
                ),
                Container(),

                // SizedBox(height: height/25,)
              ],
            ),
          ),
        );
      },

    );
  }
  void _showDetailsDialog(BuildContext context, String productName, String productDetails) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$productName'),
          content: Text('$productDetails'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

}
//
//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//
// class productDetails extends StatefulWidget {
//   const productDetails({Key? key});
//
//   @override
//   State<productDetails> createState() => _productDetailsState();
// }
//
// class _productDetailsState extends State<productDetails> {
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;
//     return StreamBuilder<QuerySnapshot>(
//       stream: FirebaseFirestore.instance.collection('product').snapshots(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: Text("Loading"),
//           );
//         }
//
//         if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//           return Text('No data');
//         }
//
//         return SingleChildScrollView(
//           child: Column(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               final productDetails = document.data() as Map<String, dynamic>;
//               return Column(
//                 children: [
//                   Stack(
//                     children: [
//                       SizedBox(
//                         height: height / 7 * 2,
//                         width: 300,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: AssetImage(productDetails['image']),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: height / 7 * 2,
//                         width: 300,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Center(
//                               child: Text(
//                                 productDetails['title'], // You can add any overlay content here
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 24.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                   Container(),
//                   Text(productDetails['title']),
//                   RatingBarIndicator(
//                     itemBuilder: (context, index) => Icon(
//                       Icons.star,
//                       color: Colors.amber,
//                     ),
//                     rating: productDetails['rating'],
//                     itemCount: 5,
//                     itemSize: width / 40,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(productDetails['price']),
//                       TextButton(
//                         onPressed: () {
//                           _showDetailsDialog(context, productDetails['title'], productDetails['details']);
//                         },
//                         child: Text("See Details"),
//                       )
//                     ],
//                   ),
//                   Container(),
//                 ],
//               );
//             }).toList(),
//           ),
//         );
//       },
//     );
//   }
//
//   void _showDetailsDialog(BuildContext context, String productName, String productDetails) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('$productName'),
//           content: Text('$productDetails'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
