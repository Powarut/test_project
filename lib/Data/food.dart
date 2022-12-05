class DataFood {
  String foodImage = '';
  String foodName = '';
  String foodType = '';
  String foodPrice = '';
  String foodNum = '';

  DataFood() {
    this.foodImage = foodImage;
    this.foodName = foodName;
    this.foodType = foodType;
    this.foodPrice = foodPrice;
    this.foodNum = foodNum;
  }
}

class ProductModle {
  String? name;
  String? image;
  int? price;

  ProductModle({required this.name, required this.image, required this.price});
}

class CartModle {
  String cartId;
  String cartImage;
  String cartname;
  int cartPrice;
  int cartQuantity;

  CartModle(
      {required this.cartId,
      required this.cartImage,
      required this.cartname,
      required this.cartPrice,
      required this.cartQuantity});
}
