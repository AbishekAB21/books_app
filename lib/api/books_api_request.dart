import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:books_app/models/model.dart'; // Adjust to your actual path

class BooksApi {
  final String baseUrl = 'https://assessment.eltglobal.in/api/books'; // Use only the base URL

  Future<List<Book>> fetchBooks({String limit = '10'}) async {
    try {
      // Construct the URL with query parameters
      final url = '$baseUrl?page=1&limit=$limit'; 
      print('Fetching books from: $url'); // Debug log
      final response = await http.get(Uri.parse(url));

      // Log the response body for debugging
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        // Check if the response is a map
        final responseData = json.decode(response.body);
        
        // Access the "result" key
        if (responseData is Map<String, dynamic> && responseData.containsKey('result')) {
          final List<dynamic> booksData = responseData['result']; // Change from 'books' to 'result'
          return booksData.map((json) => Book.fromJson(json)).toList();
        } else {
          throw Exception('Books not found in the response.');
        }
      } else {
        print('Error: ${response.statusCode} - ${response.body}');
        throw Exception('Failed to load books: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception caught: $e');
      throw Exception('Failed to load books: $e');
    }
  }
}
