import 'package:flutter/material.dart';
import 'package:test_project/Rider/delivery/order_delivery.dart';
import 'package:test_project/constants/color.dart';

class Order_detail_mem extends StatefulWidget {
  const Order_detail_mem({Key? key}) : super(key: key);

  @override
  State<Order_detail_mem> createState() => _Order_detail_memState();
}

class _Order_detail_memState extends State<Order_detail_mem> {
  void showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("ไม่"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("ใช่"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("ยกเลิกออเดอร์"),
      content: Text("ต้องการยกเลิกออเดอร์นี้หรือไม่?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: memberColor,
        title: Text("รายละเอียดออเดอร์"),
      ),
      bottomNavigationBar: Container(
        child: MaterialButton(
          onPressed: () {
            showAlertDialog(context);
          },
          child: Text("ยกเลิกออเดอร์"),
          color: memberColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text("สมพงษ์ ทรงพล   \r 0871231234"),
                    subtitle: Text(
                        "บ้านเลขที่: 556 ,ซอย/ถนน: สุขุมวิท30,ตำบล/แขวง: พระราม9,อำเภอ/เขต:บางนา, 12094"),
                  ),
                  Divider(),
                  ExpansionTile(
                    title: Text("รายการอาหาร 1"),
                    children: [
                      OrderDelivery(),
                    ],
                  ),
                  Divider(),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "ยอดชำระ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      "100\r บาท",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                ],
              );
            }),
      ),
    );
  }
}