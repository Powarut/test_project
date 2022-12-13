import 'package:flutter/material.dart';
import 'package:test_project/Rider/delivery/gps.dart';
import 'package:test_project/Rider/delivery/order_delivery.dart';
import 'package:test_project/constants/color.dart';

class delivery extends StatefulWidget {
  const delivery({Key? key}) : super(key: key);

  @override
  State<delivery> createState() => _deliveryState();
}

class _deliveryState extends State<delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, int index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: ListTile(
                  leading: Text(
                    "รอยืนยัน",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  title: Text("VcCUkXUnezOy7Vri9x3kLSVrR2N2"),
                  subtitle: Text("วันที่:10/11/2022 " + "\r เวลา: 15:05"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Delivery();
                    }));
                  },
                ),
              );
            }));
  }
}

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: riderColor,
        title: Text("รายละเอียดออเดอร์"),
      ),
      bottomNavigationBar: Container(
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => gps(),
              ),
            );
          },
          child: Text("เริ่มจัดส่งอาหาร"),
          color: riderColor,
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
