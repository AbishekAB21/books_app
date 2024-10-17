
import 'package:books_app/utils/app_theme.dart';
import 'package:flutter/material.dart';

class Fontstyles{

  static TextStyle lightTextStyle(BuildContext context){

    return TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      color: appcolor.secondaryColor,
      fontWeight: FontWeight.w300
    );
  }

  static TextStyle ContentTextStyle(BuildContext context){

    return TextStyle(
      fontFamily: 'Inter',
      fontSize: 14,
      fontWeight: FontWeight.w300
    );
  }

  static TextStyle HeadlineStyle1(BuildContext context){

    return TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w600
    );
  }
}