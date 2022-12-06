import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    String? cartId,
    String? cartName,
    String? cartImage,
    int? cartPrice,
    int? cartQuantity,
  }) async {
    await FirebaseFirestore.instance
        .collection("Member")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart")
        .doc(cartId)
        .set({
      "CartId": cartId,
      "CartName": cartName,
      "CartImage": cartImage,
      "CartPrice": cartPrice,
      "CartTotal": cartQuantity,
    });
  }
}
