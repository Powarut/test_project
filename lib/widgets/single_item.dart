import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/providers/reviewcart_provider.dart';
import 'package:test_project/widgets/count.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  String? productImage;
  String? productName;
  int? productPrice;
  String? productId;
  int? productQuantity;
  Function? onDelete;
  var productUnit;
  SingleItem(
      { this.productQuantity,
        this.productId,
        this.productUnit,
        this.onDelete,
        required this.isBool,
        this.productImage,
        this.productName,
        this.productPrice,
        });

  @override
  State<SingleItem> createState() => _SingleItemState();
}
class _SingleItemState extends State<SingleItem> {
  late ReviewCartProvider reviewCartProvider;

  late int count;
  getCount() {
    setState(() {
      count = widget.productQuantity!;
    });
  }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 90,
                  child: Center(
                    child: Image.network(
                      widget.productImage!,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.productName!,
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          Text(
                            "${widget.productPrice}\$",
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      widget.isBool == false
                          ? GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      title: new Text('50 Gram'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      title: new Text('500 Gram'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      title: new Text('1 Kg'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 15),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          height: 35,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "50 Gram",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Center(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: 20,
                                  color: memberColor,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                          : Text(widget.productUnit)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 90,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                      : EdgeInsets.only(left: 15, right: 15),
                  child: widget.isBool == false
                      ? Count(
                    productId: widget.productId!,
                    productImage: widget.productImage!,
                    productName: widget.productName!,
                    productPrice: widget.productPrice!,
                  )
                      : Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Icon(
                            Icons.delete,
                            size: 30,
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),

                        Container(
                          height: 25,
                          width: 70,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Center(
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (count == 1) {
                                      Fluttertoast.showToast(
                                        msg:
                                        "You reach minimum limit",
                                      );
                                    } else {
                                      setState(() {
                                        count--;
                                      });
                                      reviewCartProvider
                                          .updateReviewCartData(
                                        cartImage:
                                        widget.productImage,
                                        cartId: widget.productId,
                                        cartName:
                                        widget.productName,
                                        cartPrice:
                                        widget.productPrice,
                                        cartQuantity: count,
                                      );
                                    }
                                  },
                                  child: Icon(
                                    Icons.remove,
                                    color: memberColor,
                                    size: 20,
                                  ),
                                ),
                                Text(
                                  "$count",
                                  style: TextStyle(
                                    color: memberColor,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (count < 10) {
                                      setState(() {
                                        count++;
                                      });
                                      reviewCartProvider
                                          .updateReviewCartData(
                                        cartImage:
                                        widget.productImage,
                                        cartId: widget.productId,
                                        cartName:
                                        widget.productName,
                                        cartPrice:
                                        widget.productPrice,
                                        cartQuantity: count,
                                      );
                                    }
                                  },
                                  child: Icon(
                                    Icons.add,
                                    color: memberColor,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : Divider(
          height: 1,
          color: Colors.black45,
        )
      ],
    );
  }
}