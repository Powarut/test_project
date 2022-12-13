import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/providers/check_out_provider.dart';
import 'package:test_project/screens/check_out_delivery_details/google_map/google_map.dart';
import 'package:test_project/constants/costom_text_field.dart';

class AddDeliveryAddress extends StatefulWidget {
 
  @override
  State<AddDeliveryAddress> createState() =>
      _AddDeliveryAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: memberColor,
        title: Text(
          "เพิ่มที่อยู่ที่ต้องการจัดส่ง",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkoutProvider.isloadding == false
            ? MaterialButton(
                onPressed: () {
                  checkoutProvider.vaildator(context, myType);
                },
                child: Text(
                  "เพิ่มที่อยู่",
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                color: memberColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CostomTextField(
              labText: "ชื่อ",
              controller: checkoutProvider.firstName,
            ),
            CostomTextField(
              labText: "นามสกุล",
              controller: checkoutProvider.lastName,
            ),
            CostomTextField(
              labText: "เบอร์โทร",
              controller: checkoutProvider.phone,
            ),
            CostomTextField(
              labText: "บ้านเลขที่",
              controller: checkoutProvider.number,
            ),
            CostomTextField(
              labText: "ถนน/ซอย",
              controller: checkoutProvider.street,
            ),
            CostomTextField(
              labText: "ตำบล/แขวง",
              controller: checkoutProvider.landmark,
            ),
            CostomTextField(
              labText: "อำเภอ/เมือง",
              controller: checkoutProvider.city,
            ),
            CostomTextField(
              labText: "รหัสไปรษณีย์",
              controller: checkoutProvider.pincode,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CostomGoogleMap(),
                  ),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkoutProvider.setLocation == null
                        ? Text("ตั้งค่า Location")
                        : Text("เรียบร้อย!"),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("เลือกประเภทที่อยู่"),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text("บ้าน"),
              onChanged: (value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home,
                color: memberColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text("ที่ทำงาน"),
              onChanged: (value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work,
                color: memberColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("อื่นๆ"),
              onChanged: (value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.devices_other,
                color: memberColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
