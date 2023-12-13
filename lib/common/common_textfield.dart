import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField(
      {super.key,
      this.controller,
      this.themeMode,
      this.validationErrorText,
      this.lableText});

  final controller;
  final themeMode;
  final validationErrorText;
  final lableText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.trim().isEmpty) {
          return "$validationErrorText".tr;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "$lableText".tr,
        labelStyle: TextStyle(
          color: themeMode ? Colors.white : Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: themeMode ? Colors.white : Colors.teal, width: 2),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          // borderSide: BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
