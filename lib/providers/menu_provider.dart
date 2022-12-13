import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MenuProvider with ChangeNotifier{
  bool isloadding = false;
  TextEditingController foodName = TextEditingController();
  TextEditingController foodPrice = TextEditingController();
  TextEditingController foodcount = TextEditingController();

  void vaildator(context, foodType) async {
    if (foodName.text.isEmpty) {
      Fluttertoast.showToast(msg: "ป้อนใส่ชื่อ");
    } else if (foodPrice.text.isEmpty) {
      Fluttertoast.showToast(msg: "โปรดใส่ราคา");
    } else {
      isloadding = true;
      notifyListeners();
      await FirebaseFirestore.instance.collection("Food").doc(FirebaseAuth.instance.currentUser!.uid).set({
        "FoodName": foodName.text,
        "FoodPrice": foodPrice.text,
        "AddressType": foodType.toString(),
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
}