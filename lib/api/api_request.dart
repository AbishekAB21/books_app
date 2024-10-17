import 'dart:convert';
import 'package:books_app/models/model.dart';
import 'package:http/http.dart' as http;

class BooksApi {
  final String apiKey = 'AIzaSyCNX90qklU7TCuozS-LoLmX4OwvSPyg9Bs';

  Future<List<Book>> searchBooks(String query) async {
    final url =
        'https://www.googleapis.com/books/v1/volumes?q=$query&key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<Book> books = [];
      for (var item in jsonData['items']) {
        books.add(Book.fromJson(item));
      }
      return books;
    } else {
      throw Exception('Failed to load books');
    }
  }
}
