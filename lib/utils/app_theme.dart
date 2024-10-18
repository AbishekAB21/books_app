import 'package:flutter/material.dart';

AppColor appcolor = AppDefaultColor();

abstract class AppColor {
  final Color backgroundColor;
  final Color primaryColor;
  final Color borderColor;
  final Color borderColor2;
  final Color borderColor3;
  final Color secondaryColor;
  final Color successColor;
  final Color errorColor;

  AppColor({
    required this.backgroundColor,
    required this.primaryColor,
    required this.borderColor,
    required this.borderColor2,
    required this.borderColor3,
    required this.secondaryColor,
    required this.successColor,
    required this.errorColor
  });
}

class AppDefaultColor extends AppColor {
  AppDefaultColor()
      : super(
            backgroundColor: Colors.grey.shade50,
            primaryColor: Colors.orange,
            borderColor: Colors.grey.shade300,
            borderColor2: Colors.white,
            borderColor3: Colors.black87,
            secondaryColor: Colors.grey,
            successColor: Colors.green,
            errorColor: Colors.red,
            );
}
