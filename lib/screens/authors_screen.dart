import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/widgets/author_builder.dart';
import 'package:books_app/widgets/reusable_appbar.dart';
import 'package:flutter/material.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appcolor.backgroundColor,
      appBar: ReusableAppBar(title: "Authors"),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: 5,
        separatorBuilder: (context, index) => SizedBox(
          height: 5,
        ),
        itemBuilder: (context, index) {
          return AuthorBuilder();
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: appcolor.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Icon(
            Icons.add_rounded,
            size: 30,
            color: appcolor.backgroundColor,
          ),
          onPressed: () {}),
    );
  }
}
