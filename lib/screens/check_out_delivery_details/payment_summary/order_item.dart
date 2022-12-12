import 'package:flutter/material.dart';
import 'package:test_project/cart/cart_model.dart';

class OrderItem extends StatelessWidget {
  late bool isTrue;
  final ReviewCartModel e;
  OrderItem({required this.e});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListTile(
        leading: Image.network(
          e.cartImage,
          width: 60,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
                e.cartName,
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            Text(
              "หมู",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
            Text(
              "${e.cartPrice} \rบาท",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        subtitle: Text(e.cartQuantity.toString()),
      ),
    );
  }
}
