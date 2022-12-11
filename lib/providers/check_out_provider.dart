import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CheckoutProvider with ChangeNotifier{
  bool isloadding =false;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pincode = TextEditingController();
  
  void vaildator(context,myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "ป้อนใส่ชื่อ");
    }else if (lastName.text.isEmpty){
      Fluttertoast.showToast(msg: "โปรดใส่นามสกุล");
    }else if (phone.text.isEmpty){
      Fluttertoast.showToast(msg: "โปรดใส่เบอร์โทร");
    }else if (number.text.isEmpty){
      Fluttertoast.showToast(msg: "โปรดใส่บ้านเลขที่");
    }else if (street.text.isEmpty){
      Fluttertoast.showToast(msg: "โปรดใส่ถนน/ซอย");
    }else if (landmark.text.isEmpty){
      Fluttertoast.showToast(msg: "โปรดใส่ตำบล/แขวง");
    }else if (city.text.isEmpty){
      Fluttertoast.showToast(msg: "โปรดใส่อำเภอ");
    }else if (pincode.text.isEmpty){
      Fluttertoast.showToast(msg: "โปรดใส่รหัสไปรษณีย์");
    }else{
      isloadding = true;
      notifyListeners();
      await FirebaseFirestore.instance
          .collection("OrderDetail")
          .doc("docID")
          .set({
            "UserName":firstName.text,
            "UserSurname":firstName.text,
            "UserTel":firstName.text,
            "UserNum":firstName.text,
            "UserStreet":firstName.text,
            "UserLandmark":firstName.text,
            "UserCity":firstName.text,
            "UserPinCode":firstName.text,
            "AddressType":myType.toString(),
      }).then((value)  async{
        isloadding = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "เพิ่มข้อมูลที่จักส่งเรียบร้อย");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }
}