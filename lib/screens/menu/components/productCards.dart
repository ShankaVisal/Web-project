import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '/model.dart/product_model.dart';

class menuProducts extends StatefulWidget {
  final Product product;

  const menuProducts({Key? key, required this.product}) : super(key: key);

  @override
  State<menuProducts> createState() => _menuProductsState();
}

class _menuProductsState extends State<menuProducts> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
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
                            image: AssetImage(widget.product.image),
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
                          widget.product.title, // You can add any overlay content here
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
            Text(widget.product.title),
            RatingBarIndicator(
                itemBuilder: (context, index)=> Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
              rating: widget.product.rating,
              itemCount: 5,
              itemSize: width/40,


            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.product.price),
                TextButton(onPressed: (){}, child: Text("See Details"))
              ],
            ),
            SizedBox(height: height/25,)
          ],
        ),
      ),
    );
  }
}
