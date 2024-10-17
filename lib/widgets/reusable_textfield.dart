import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';

class ReusableTextfield extends StatelessWidget {
  final String hint;
  final int maxline;
  final Icon? icon;
  ReusableTextfield({super.key, required this.hint, required this.maxline, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        style: Fontstyles.HeadlineStyle3(context),
        maxLines: maxline,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: appcolor.borderColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: appcolor.primaryColor)),
            hintText: hint,
            hintFadeDuration: Durations.medium2,
            hintStyle: Fontstyles.lightTextStyle(context),
            ),
      ),
    );
  }
}
