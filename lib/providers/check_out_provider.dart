import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:location/location.dart';
import 'package:test_project/Model/delivery_address_model.dart';

class CheckoutProvider with ChangeNotifier {
  bool isloadding = false;

  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController landmark = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController pincode = TextEditingController();
  LocationData? setLocation;

  void vaildator(context, myType) async {
    if (firstName.text.isEmpty) {
      Fluttertoast.showToast(msg: "ป้อนใส่ชื่อ");
    } else if (lastName.text.isEmpty) {
      Fluttertoast.showToast(msg: "โปรดใส่นามสกุล");
    } else if (phone.text.isEmpty) {
      Fluttertoast.showToast(msg: "โปรดใส่เบอร์โทร");
    } else if (number.text.isEmpty) {
      Fluttertoast.showToast(msg: "โปรดใส่บ้านเลขที่");
    } else if (street.text.isEmpty) {
      Fluttertoast.showToast(msg: "โปรดใส่ถนน/ซอย");
    } else if (landmark.text.isEmpty) {
      Fluttertoast.showToast(msg: "โปรดใส่ตำบล/แขวง");
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(msg: "โปรดใส่อำเภอ");
    } else if (pincode.text.isEmpty) {
      Fluttertoast.showToast(msg: "โปรดใส่รหัสไปรษณีย์");
    } else if (setLocation!.latitude == null) {
      Fluttertoast.showToast(msg: "โปรดตั้งโลเคชั่น");
    } else {
      isloadding = true;
      notifyListeners();
      await FirebaseFirestore.instance.collection("OrderDetail").doc(FirebaseAuth.instance.currentUser!.uid).set({
        "UserName": firstName.text,
        "UserSurname": lastName.text,
        "UserTel": phone.text,
        "UserNum": number.text,
        "UserStreet": street.text,
        "UserLandmark": landmark.text,
        "UserCity": city.text,
        "UserPinCode": pincode.text,
        "AddressType": myType.toString(),
        "longitude": setLocation!.longitude,
        "latitude": setLocation!.latitude,
      }).then((value) async {
        isloadding = false;
        notifyListeners();
        await Fluttertoast.showToast(msg: "เพิ่มข้อมูลที่จักส่งเรียบร้อย");
        Navigator.of(context).pop();
        notifyListeners();
      });
      notifyListeners();
    }
  }

  List<DeliveryAddressModel> deliveryAdressList = [];
  getDeliveryAddressData() async {
    List<DeliveryAddressModel> newList = [];

    late DeliveryAddressModel deliveryAddressModel;
    DocumentSnapshot _db =
        await FirebaseFirestore.instance.collection("OrderDetail").doc(FirebaseAuth.instance.currentUser!.uid).get();
    if (_db.exists) {
      deliveryAddressModel = DeliveryAddressModel(
        firstName: _db.get("UserName"),
        lastName: _db.get("UserSurname"),
        phone: _db.get("UserTel"),
        number: _db.get("UserNum"),
        street: _db.get("UserStreet"),
        landmark: _db.get("UserLandmark"),
        city: _db.get("UserCity"),
        pinCode: _db.get("UserPinCode"),
        addressType: _db.get("AddressType"),
      );
      newList.add(deliveryAddressModel);
      notifyListeners();
    }
    deliveryAdressList = newList;
    notifyListeners();
  }

  List<DeliveryAddressModel> get getDeliveryAddressList{
    return deliveryAdressList;
  }
}
