import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:books_app/utils/app_theme.dart';
import 'package:books_app/widgets/book_builder.dart';
import 'package:books_app/widgets/reusable_appbar.dart';
import 'package:books_app/widgets/search_box.dart';

// Function to fetch books from Google Books API
Future<List<Map<String, String>>> fetchRandomBooks() async {
  final String apiKey = 'AIzaSyCNX90qklU7TCuozS-LoLmX4OwvSPyg9Bs'; // Replace with your API key
  final String url = 'https://www.googleapis.com/books/v1/volumes?q=book&maxResults=10&key=$apiKey';
  
  final response = await http.get(Uri.parse(url));
  
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    final List<Map<String, String>> books = [];
    
    for (var item in data['items']) {
      books.add({
        'title': item['volumeInfo']['title'] ?? 'No Title',
        'author': (item['volumeInfo']['authors'] != null)
            ? item['volumeInfo']['authors'].join(', ')
            : 'Unknown Author',
        'price': '₹399', // Add logic for price if available
        'image': item['volumeInfo']['imageLinks']?['thumbnail'] ?? 'default_image_url'
      });
    }
    
    return books;
  } else {
    throw Exception('Failed to load books');
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> books = [];
  bool isLoading = true;
  final TextEditingController searchController = TextEditingController();

  @override
 void initState() {
  super.initState();
  fetchRandomBooks().then((bookList) {
    setState(() {
      books = bookList;
      isLoading = false;
    });
  }).catchError((error) {
    print(error);
    setState(() {
      isLoading = false;
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appcolor.backgroundColor,
        appBar: ReusableAppBar(title: "App name"),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      SearchBox(cntlr: searchController),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: books.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5,
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
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(),
            );
          },
          backgroundColor: appcolor.primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
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
