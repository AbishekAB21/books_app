
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
      fontWeight: FontWeight.w700
    );
  }

   static TextStyle ContentTextStyle2(BuildContext context){

    return TextStyle(
      fontFamily: 'Inter',
      fontSize: 12,
      fontWeight: FontWeight.w700
    );
  }

   static TextStyle ContentTextStyle3(BuildContext context){

    return TextStyle(
      fontFamily: 'Inter',
      fontSize: 12,
      color: Colors.grey.shade400,
      fontWeight: FontWeight.w400
    );
  }

   static TextStyle ContentTextStyle4(BuildContext context){

    return TextStyle(
      fontFamily: 'Inter',
      fontSize: 12,
      color: Colors.grey.shade600,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle HeadlineStyle1(BuildContext context){

    return TextStyle(
      fontFamily: 'Inter',
      fontSize: 20,
      fontWeight: FontWeight.w600
    );
  }

  static TextStyle HeadlineStyle2(BuildContext context){

    return TextStyle(
      fontFamily: 'Inter',
      fontSize: 18,
      fontWeight: FontWeight.w700
    );
  }

  static TextStyle BoldandSmallStyle(BuildContext context){

    return TextStyle(
      fontFamily: 'Inter',
      fontSize: 15,
      fontWeight: FontWeight.w900
    );
  }

  static TextStyle ButtonText1(BuildContext context){

    return TextStyle(
      fontFamily: 'Inter',
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.w600
    );
  }
}