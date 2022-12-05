import 'package:flutter/material.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/widgets/single_item.dart';


class ReviewCart extends StatelessWidget {
  const ReviewCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("ราคาทั้งหมด :"),
        subtitle: Text(
          " \$ 170.0 \rบาท",
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("สั่งอาหาร"),
            color: memberColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            onPressed: (){},
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: memberColor,
        title: Text(
          "รถเข็น",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          SingleItem(
            isBool: true,
            productImage: '',
            productName: '',
            productPrice: 2,
          ),

        ],
      ),
    );
  }
}
