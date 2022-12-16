import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/Model/delivery_address_model.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/providers/check_out_provider.dart';
import 'package:test_project/providers/reviewcart_provider.dart';
import 'package:test_project/screens/check_out_delivery_details/payment_summary/order_item.dart';
import 'package:test_project/screens/check_out_delivery_details/single_delivery_item.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliveryAddressList;
  PaymentSummary({required this.deliveryAddressList});

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

enum PaymentTypes {
  Cash,
  online,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  PaymentTypes? _paymentTypes;

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
      title: Text("สั่งอาหาร"),
      content: Text("คุณยืนยันการสั่งอาหารออเดอร์นี้ใช่ไหม?"),
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
    ReviewCartProvider revierCartProvider = Provider.of(context);
    revierCartProvider.getReviewCartData();

    double discount;

    double totalPrice = revierCartProvider.getTotalPrice();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: memberColor,
        title: Text(
          "สรุปยอดชำระ",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text("รวมยอดชำระ"),
        subtitle: Text(
          "${totalPrice} \rบาท",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              showAlertDialog(context);
            },
            child: Text(
              "ยืนยันการสั่ง",
              style: TextStyle(
                color: textColor,
              ),
            ),
            color: memberColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
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
                  SingleDeliveryItem(
                    address: "${widget.deliveryAddressList.number},"
                        "${widget.deliveryAddressList.street},"
                        "${widget.deliveryAddressList.landmark},"
                        "${widget.deliveryAddressList.city},"
                        "${widget.deliveryAddressList.pinCode}",
                    title:
                        "${widget.deliveryAddressList.firstName} \r${widget.deliveryAddressList.lastName}",
                    number: "${widget.deliveryAddressList.phone}",
                    addressType: widget.deliveryAddressList.addressType ==
                            "AddressTypes.Other"
                        ? "Other"
                        : widget.deliveryAddressList.addressType ==
                                "AddressTypes.Home"
                            ? "Home"
                            : "Work",
                  ),
                  Divider(),
                  ExpansionTile(
                    children: revierCartProvider.getReviewCartDataList.map((e) {
                      return OrderItem(e: e);
                    }).toList(),
                    title: Text("รายการอาหาร ${revierCartProvider.getReviewCartDataList.length}"),
                  ),
                  Divider(),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "รวมทั้งหมด",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "${totalPrice} \rบาท",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "ส่วนลด",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "200 \rบาท",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListTile(
                    minVerticalPadding: 5,
                    leading: Text(
                      "ราคาสุทธิ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Text(
                      "${totalPrice} \rบาท",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text("เลือกช่องทางชำระเงิน"),
                  ),
                  RadioListTile(
                    value: PaymentTypes.Cash,
                    groupValue: _paymentTypes,
                    title: Text("เงินสด"),
                    onChanged: (value) {
                      setState(() {
                        _paymentTypes = value;
                      });
                    },
                    secondary: Icon(
                      Icons.local_atm_outlined,
                      color: memberColor,
                    ),
                  ),
                  RadioListTile(
                    value: PaymentTypes.online,
                    groupValue: _paymentTypes,
                    title: Text("โอนผ่านธนาคาร"),
                    onChanged: (value) {
                      setState(() {
                        _paymentTypes = value;
                      });
                    },
                    secondary: Icon(
                      Icons.atm_outlined,
                      color: memberColor,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
