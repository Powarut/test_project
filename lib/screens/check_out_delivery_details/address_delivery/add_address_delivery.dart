import 'package:flutter/material.dart';
class AddDeliveryAddressState extends StatefulWidget {
  const AddDeliveryAddressState({Key? key}) : super(key: key);

  @override
  State<AddDeliveryAddressState> createState() => _AddDeliveryAddressStateState();
}

class _AddDeliveryAddressStateState extends State<AddDeliveryAddressState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
        height: 48,
      ),
    );
  }
}
