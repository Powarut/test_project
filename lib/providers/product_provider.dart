import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:test_project/Model/product_modle.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

  productModels(QueryDocumentSnapshot element) {

    productModel = ProductModel(
      productImage: element.get("FoodImange"),
      productName: element.get("FoodName"),
      productPrice: element.get("FoodPrice"),
      productId: element.get("FoodId"),
      productQuantity: element.get("FoodQuantity"),
      productUnit: element.get("FoodType")
    );
  }

  ///////////////////////// Food Product  ////////////////////////////
  List<ProductModel> oneProductList = [];


  fatchOneProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
        await FirebaseFirestore.instance.collection('Food').get();

    value.docs.forEach(
      (element) {
        productModels(element);
        newList.add(productModel);
      },
    );
    oneProductList =newList;
    notifyListeners();
  }

  List<ProductModel>get getOneProductDataList{
    return oneProductList;
  }


///////////////////////// Food2 Product  ////////////////////////////
  List<ProductModel> twoProductList = [];


  fatchTwoProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("Food2").get();

    value.docs.forEach(
          (element) {
            productModels(element);
        newList.add(productModel);
      },
    );
    oneProductList =newList;
    notifyListeners();
  }

  List<ProductModel>get getTwoProductDataList{
    return oneProductList;
  }


///////////////////////// Drink Product  ////////////////////////////
  List<ProductModel> drinkProductList = [];


  fatchDrinkProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot value =
    await FirebaseFirestore.instance.collection("Drink").get();

    value.docs.forEach(
          (element) {
            productModels(element);
        newList.add(productModel);
      },
    );
    oneProductList =newList;
    notifyListeners();
  }

  List<ProductModel>get getDrinkProductDataList{
    return oneProductList;
  }
}
