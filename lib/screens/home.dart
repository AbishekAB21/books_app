import 'package:flutter/material.dart';
import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/widgets/book_builder.dart';
import 'package:books_app/widgets/reusable_appbar.dart';
import 'package:books_app/widgets/search_box.dart';

// Dummy book data
final List<Map<String, String>> books = [
  {
    "title": "Rich Dad Poor Dad",
    "author": "Robert T. Kiyosaki",
    "price": "₹850.00",
    "image": "assets/rich-dad-poor-dad.jpg"
  },
  {
    "title": "Atomic Habits",
    "author": "James Clear",
    "price": "₹899.00",
    "image": "assets/rich-dad-poor-dad.jpg"
  },
  {
    "title": "The Psychology of Money",
    "author": "Morgan Housel",
    "price": "₹334.00",
    "image": "assets/rich-dad-poor-dad.jpg"
  },
  {
    "title": "The 7 Habits of Highly Effective People",
    "author": "Stephen R. Covey",
    "price": "₹550.00",
    "image": "assets/rich-dad-poor-dad.jpg"
  },
  {
    "title": "The 7 Habits of Highly Effective People",
    "author": "Stephen R. Covey",
    "price": "₹550.00",
    "image": "assets/rich-dad-poor-dad.jpg"
  },
  {
    "title": "The 7 Habits of Highly Effective People",
    "author": "Stephen R. Covey",
    "price": "₹550.00",
    "image": "assets/rich-dad-poor-dad.jpg"
  }
];

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
              SearchBox(cntlr: searchController),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: books.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return BookBuilder(
                      imageUrl: books[index]['image']!,
                      bookName: books[index]['title']!,
                      authorName: books[index]['author']!,
                      price: books[index]['price']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // Add Books
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(),
            );
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
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Authors"),
        ]),
      ),
    );
  }
}
