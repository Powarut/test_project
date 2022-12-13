import 'package:flutter/material.dart';


class OrderDelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListTile(
        leading: Image.network(
          "https://firebasestorage.googleapis.com/v0/b/project-3e0ab.appspot.com/o/%E0%B8%81%E0%B8%B0%E0%B9%80%E0%B8%9E%E0%B8%A3%E0%B8%B2.jpg?alt=media&token=dfaf4fc3-4032-41df-a858-a894f63d97ac",
          width: 60,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "กะเพรา",
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
              "50 \rบาท",
              style: TextStyle(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
        subtitle: Text("2"),
      ),
    );
  }
}
