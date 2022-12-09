class ReviewCartModel {
  String cartId;
  String cartName;
  String cartImage;
  int cartPrice;
  int cartQuantity;
  var cartUnit;
  ReviewCartModel({
    this.cartUnit,
    required this.cartId,
    required this.cartName,
    required this.cartImage,
    required this.cartPrice,
    required this.cartQuantity,
});
}