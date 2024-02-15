import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '/model.dart/product_model.dart';

import '../../../constants.dart';

class Products extends StatelessWidget {
  const Products({
    Key? key,
    required this.product,
    required this.press,
  }) : super(key: key);
  final Product product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all( height/ 200),
        child: InkWell(
          onTap: press,
          child: Material(
            borderRadius: BorderRadius.circular(15),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    product.image,
                  ),
                ),
                SizedBox(
                  height: height/100,
                ),
                AutoSizeText(
                  product.title,
                  maxLines: 2,
                  minFontSize: 14,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                // SizedBox(
                //   height: height/100,
                // ),
                // Padding(
                //     padding: EdgeInsets.only(left: kPadding*3 ,right: kPadding*3),
                //   child: OutlinedButton(
                //       onPressed: (){},
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //         children: [
                //           AutoSizeText(
                //             "Oder now",
                //             maxLines: 2,
                //             minFontSize: 10,
                //             style: TextStyle(
                //                 fontSize: 12,
                //                 fontWeight: FontWeight.w300
                //             ),
                //           ),
                //           Icon(Icons.restaurant,
                //           size: height/50,)
                //         ],
                //       ),
                //   ),
                // ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
