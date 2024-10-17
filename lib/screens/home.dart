import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/widgets/reusable_appbar.dart';
import 'package:books_app/widgets/search_box.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appcolor.backgroundColor,
        appBar: ReusableAppBar(title: "App name"),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),
              SearchBox(cntlr: searchController,)
            ],
          ),
        )
      ),
    );
  }
}