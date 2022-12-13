import 'package:flutter/material.dart';
class CostomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labText;
  final TextInputType? keybordType;
  CostomTextField({this.controller,this.keybordType,this.labText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keybordType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labText,
      ),
    );
  }
}
