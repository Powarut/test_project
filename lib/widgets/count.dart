import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/constants/color.dart';
import '../providers/reviewcart_provider.dart';

class Count extends StatefulWidget {
  final String cartId;
  final String cartName;
  final String cartImage;
  final int cartPrice;

  Count({
    required this.cartId,
    required this.cartName,
    required this.cartImage,
    required this.cartPrice,
  });

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext Countext) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                    }
                    if (count == 1) {
                      setState(() {
                        isTrue = false;
                      });
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 15,
                    color: memberColor,
                  ),
                ),
                Text(
                  "$count",
                  style: TextStyle(
                      color: Colors.brown, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: memberColor,
                  ),
                ),
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                  });
                 reviewCartProvider.addReviewCartData(
                     cartId: widget.cartId,
                     cartName: widget.cartName,
                     cartImage: widget.cartImage,
                     cartPrice: widget.cartPrice,
                     cartQuantity: count,
                 );
                },
                child: Text(
                  "ADD",
                  style: TextStyle(color: memberColor),
                ),
              ),
            ),
    );
  }
}
