import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/providers/check_out_provider.dart';
import 'package:test_project/screens/check_out_delivery_details/address_delivery/add_address_delivery.dart';
import 'package:test_project/screens/check_out_delivery_details/payment_summary/payment_summary.dart';
import 'package:test_project/screens/check_out_delivery_details/single_delivery_item.dart';
import '../../Model/delivery_address_model.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryAddressModel value;

  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: memberColor,
        title: Text("รายละเอียดการจัดส่ง"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: memberColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliveryAddress(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 48,
        // width :160,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Text("เพิ่มที่อยู่จัดส่งใหม่")
              : Text("ชำระเงิน"),
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddDeliveryAddress(),
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
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Center(
                  child: Container(
                    child: Center(
                      child: Text("ไม่มีข้อมูล"),
                    ),
                  ),
                )
              : Column(
                  children: deliveryAddressProvider.getDeliveryAddressList
                      .map<Widget>((e) {
                    setState(() {
                      value = e;
                    });
                    return SingleDeliveryItem(
                      address:
                          "${e.number},${e.street},${e.landmark},${e.city},${e.pinCode}",
                      title: "${e.firstName} \r${e.lastName}",
                      number: "${e.phone}",
                      addressType: e.addressType == "AddressTypes.Other"
                          ? "Other"
                          : e.addressType == "AddressTypes.Home"
                              ? "Home"
                              : "Work",
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}
