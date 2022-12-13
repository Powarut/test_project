import 'package:flutter/material.dart';
import 'package:test_project/Order/order_delivery.dart';
import 'package:test_project/Rider/delivery/order_delivery.dart';
import 'package:test_project/constants/color.dart';

class orderIN extends StatefulWidget {
  @override
  State<orderIN> createState() => _orderINState();
}

class _orderINState extends State<orderIN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, int index){
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
              child: ListTile(
                leading: Text("รอยืนยัน"),
                title: Text("Er5l6HrLbRnMX4fmHenb"),
                subtitle: Text("วันที่:10/11/2022 "+"\r เวลา: 15:05"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return OrderDetailIn();
                  }));
                },
              ),
            );
          }
      ),
    );
  }
}

class OrderDetailIn extends StatefulWidget {
  const OrderDetailIn({Key? key}) : super(key: key);

  @override
  State<OrderDetailIn> createState() => _OrderDetailInState();
}

class _OrderDetailInState extends State<OrderDetailIn> {
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
      title: Text("รับออเดอร์"),
      content: Text("ยืนยันการรับออเดอร์นี้หรือไม่?"),
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
        backgroundColor: ownerColor,
        title: Text("รายละเอียดออเดอร์"),
      ),
      bottomNavigationBar: Container(
        child: MaterialButton(
          onPressed: () {
            showAlertDialog(context);
          },
          child: Text("รับออเดอร์"),
          color: ownerColor,
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
