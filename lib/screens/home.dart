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
              SizedBox(
                height: 10,
              ),
              SearchBox(
                cntlr: searchController,
              ),

    // Display Books

            ],
          ),
        ),

    // Add Books
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(context: context, builder: (context) => AlertDialog(),);
          },
          backgroundColor: appcolor.primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Icon(
            Icons.add_rounded,
            size: 28,
            color: appcolor.backgroundColor,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Authors"),
        ]),
      ),
    );
  }
}
