import 'package:books_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:books_app/utils/fontstyles.dart';

class ReusableAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const ReusableAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: appcolor.backgroundColor,
      title: Text(
        title,
        style: Fontstyles.HeadlineStyle1(context),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); 
}
