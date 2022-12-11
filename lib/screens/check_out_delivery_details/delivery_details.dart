import 'package:flutter/material.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/screens/check_out_delivery_details/address_delivery/add_address_delivery.dart';
import 'package:test_project/screens/check_out_delivery_details/payment_summary/payment_summary.dart';
import 'package:test_project/screens/check_out_delivery_details/single_delivery_item.dart';

class DeliveryDetails extends StatelessWidget {
  List<Widget> address = [
    // SingleDeliveryItem(
    //   address: "56/3 อ.เมืองเอก ต.หลักหก จ.ปทุมธานี 22140",
    //   title: "สมพงษ์ คำเหล่า",
    //   number: "0988641234",
    //   addressType: "Home",
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: memberColor,
        title: Text("รายละเอียดการจัดส่ง"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: memberColor,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      bottomNavigationBar: Container(
        height: 48,
        // width :160,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: address .isEmpty
              ? Text("เพิ่มที่อยู่จัดส่งใหม่")
              : Text("ชำระเงิน"),
          onPressed: () {
            address.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddDeliveryAddressState(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(),
                    ),
                  );
          },
          color: memberColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("จัดส่งที่"),
            leading: Image.asset(
              "assets/images/location.png",
              height: 30,
            ),
          ),
          Divider(
            height: 1,
          ),
          Column(
            children: [
              address.isEmpty
                  ? Container()
                  : SingleDeliveryItem(
                      address: "56/3 อ.เมืองเอก ต.หลักหก จ.ปทุมธานี 22140",
                      title: "สมพงษ์ คำเหล่า",
                      number: "0988641234",
                      addressType: "Home",
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
