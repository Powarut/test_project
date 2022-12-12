class DeliveryAddressModel{
  String? firstName;
  String? lastName;
  String? phone;
  String? number;
  String? street;
  String? landmark;
  String? city;
  String? pinCode;
  String? addressType;
  DeliveryAddressModel({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.number,
    required this.street,
    required this.landmark,
    required this.city,
    required this.pinCode,
    this.addressType,
});
}