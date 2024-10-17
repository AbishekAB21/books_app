import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  const ReusableButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: appcolor.primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
          child: Text(
        "Add author",
        style: Fontstyles.ButtonText2(context),
      )),
    );
  }
}
