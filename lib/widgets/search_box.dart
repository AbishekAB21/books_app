import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/utils/fontstyles.dart';
import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController cntlr;
  const SearchBox({super.key, required this.cntlr});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: appcolor.borderColor),
      child: TextFormField(
        controller: cntlr,
        style: Fontstyles.ContentTextStyle(context),
        decoration: InputDecoration(
            isDense: true,
            prefixIcon: Icon(
              Icons.search,
              size: 20,
            ),
            prefixIconColor: appcolor.secondaryColor,
            hintText: "Search..",
            hintStyle: Fontstyles.lightTextStyle(context),
            border: UnderlineInputBorder(borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            ),
      ),
    );
  }
}
