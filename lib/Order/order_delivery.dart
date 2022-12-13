import 'package:flutter/material.dart';
import 'package:test_project/Owner/HomeOwner.dart';
import 'package:test_project/Rider/delivery/order_delivery.dart';
import 'package:test_project/constants/color.dart';

class orderSend extends StatefulWidget {
  const orderSend({Key? key}) : super(key: key);

  @override
  State<orderSend> createState() => _orderSendState();
}

class _orderSendState extends State<orderSend> {
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
                  leading: Text("รอจัดส่ง"),
                  title: Text("VcCUkXUnezOy7Vri9x3kLSVrR2N2"),
                  subtitle: Text("วันที่:10/11/2022 "+"\r เวลา: 15:05"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return orderSendDetail();
                    }));
                  },
                ),
              );
            }
        )
    );
  }
}

class orderSendDetail extends StatefulWidget {
  const orderSendDetail({Key? key}) : super(key: key);

  @override
  State<orderSendDetail> createState() => _orderSendDetailState();
}

class _orderSendDetailState extends State<orderSendDetail> {
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
      title: Text("จัดส่งออเดอร์"),
      content: Text("พร้อมจัดส่งแล้วใช่ไหม?"),
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
          child: Text("จัดส่งอาหาร"),
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


