import 'package:flutter/material.dart';
import 'package:test_project/Order/order_delivery.dart';
import 'package:test_project/Rider/delivery/order_delivery.dart';
import 'package:test_project/constants/color.dart';

class orderfinish extends StatefulWidget {
  const orderfinish({Key? key}) : super(key: key);

  @override
  State<orderfinish> createState() => _orderfinishState();
}

class _orderfinishState extends State<orderfinish> {
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
                  leading: Text("สำเร็จ",style: TextStyle(color: Colors.green),),
                  title: Text("VcCUkXUnezOy7Vri9x3kLSVrR2N2"),
                  subtitle: Text("วันที่:10/11/2022 "+"\r เวลา: 15:05"),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return orderFinnish();
                    }));
                  },
                ),
              );
            }
        )
    );
  }
}
class orderFinnish extends StatefulWidget {
  const orderFinnish({Key? key}) : super(key: key);

  @override
  State<orderFinnish> createState() => _orderFinnishState();
}

class _orderFinnishState extends State<orderFinnish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: riderColor,
        title: Text("รายละเอียดออเดอร์"),
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


