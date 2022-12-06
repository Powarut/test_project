import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class User_provider with ChangeNotifier {
  void addUserData(
      {required User currentUser,
      required String userName,
      required String userEmail,
      required String userSurname}) async {
    await FirebaseFirestore.instance
        .collection("Member")
        .doc(currentUser.uid)
        .set({
      "UserName": userName,
      "UserSurname": userSurname,
      "UserEmail": userEmail,
      "UserId": currentUser.uid,
    });
  }
}
