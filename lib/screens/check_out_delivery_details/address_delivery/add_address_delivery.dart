import 'package:flutter/material.dart';
import 'package:test_project/constants/color.dart';
import 'package:test_project/widgets/costom_text_field.dart';

class AddDeliveryAddressState extends StatefulWidget {
  const AddDeliveryAddressState({Key? key}) : super(key: key);

  @override
  State<AddDeliveryAddressState> createState() =>
      _AddDeliveryAddressStateState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliveryAddressStateState extends State<AddDeliveryAddressState> {
  AddressTypes? _addressTypes;
  @override
  Widget build(BuildContext context) {
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
        child: MaterialButton(
          onPressed: () {},
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
            ),
            CostomTextField(
              labText: "นามสกุล",
            ),
            CostomTextField(
              labText: "เบอร์โทร",
            ),
            CostomTextField(
              labText: "บ้านเลขที่",
            ),
            CostomTextField(
              labText: "ถนน/ซอย",
            ),
            CostomTextField(
              labText: "ตำบล/แขวง",
            ),
            CostomTextField(
              labText: "อำเภอ",
            ),
            CostomTextField(
              labText: "รหัสไปรษณีย์",
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ตั้งค่า Location"),
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
              groupValue: _addressTypes,
              title: Text("บ้าน"),
              onChanged: (value) {
                setState(() {
                  _addressTypes = value;
                });
              },
              secondary: Icon(
                Icons.home,
                color: memberColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: _addressTypes,
              title: Text("ที่ทำงาน"),
              onChanged: (value) {
                setState(() {
                  _addressTypes = value;
                });
              },
              secondary: Icon(
                Icons.work,
                color: memberColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: _addressTypes,
              title: Text("อื่นๆ"),
              onChanged: (value) {
                setState(() {
                  _addressTypes = value;
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
