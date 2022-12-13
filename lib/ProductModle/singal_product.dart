import 'package:flutter/material.dart';
import 'package:test_project/Model/product_modle.dart';
import 'package:test_project/ProductModle/ProductOverview.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/widgets/count.dart';

class SingalProduct extends StatelessWidget {
  String? productImage;
  String? productName;
  int? productPrice;
  Function onTap;
  String? productId;
  ProductModel? productUnit;
  SingalProduct({
    this.productImage,
    this.productName,
    this.productPrice,
    required this.onTap,
    this.productId,
    this.productUnit,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
            width: 165,
            decoration: BoxDecoration(
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productName: productName,
                          productImage: productImage,
                          productPrice: productPrice,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      productImage!,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            productName!,
                            style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$productPrice',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(left: 5),
                                    height: 25,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                              'หมู',
                                              style: TextStyle(fontSize: 10),
                                            )),
                                        Center(
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            size: 19,
                                            color: Colors.brown,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Count(
                                  productId: productId!,
                                  productName: productName!,
                                  productImage: productImage!,
                                  productPrice: productPrice!,
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
