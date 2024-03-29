import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_project/cart/cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  void addReviewCartData({
    String? cartId,
    String? cartName,
    String? cartImage,
    int? cartPrice,
    int? cartQuantity,
    var cartUnit,
  }) async {
    await FirebaseFirestore.instance
        .collection("Member")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart")
        .doc(cartId)
        .set(
      {
        "CartId": cartId,
        "CartName": cartName,
        "CartImage": cartImage,
        "CartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "cartUnit": cartUnit,
        "isAdd": true,
      },
    );
  }

  void updateReviewCartData({
    String? cartId,
    String? cartName,
    String? cartImage,
    int? cartPrice,
    int? cartQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("Member")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart")
        .doc(cartId)
        .update(
      {
        "cartId": cartId,
        "cartName": cartName,
        "cartImage": cartImage,
        "cartPrice": cartPrice,
        "cartQuantity": cartQuantity,
        "isAdd": true,
      },
    );
  }

  List<ReviewCartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];

    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("Member")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart")
        .get();
    reviewCartValue.docs.forEach((element) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get("cartId"),
        cartName: element.get("cartName"),
        cartImage: element.get("cartImage"),
        cartPrice: element.get("cartPrice"),
        cartQuantity: element.get("cartQuantity"),
      );
      newList.add(reviewCartModel);
    });
    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }

  //// TotalPrice  ///

  getTotalPrice() {
    double total = 0.0;
    reviewCartDataList.forEach((element) {
      total += element.cartPrice * element.cartQuantity;
    });
    return total;
  }

  ////////////////////////ส่วนลบรายการในรถเข็น//////////////////////////////
  reviewCartDataDelete(cartId) {
    FirebaseFirestore.instance
        .collection("Member")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("Cart")
        .doc(cartId)
        .delete();
    notifyListeners();
  }
}
