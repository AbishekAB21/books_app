import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:books_app/models/model.dart';

class BooksApi {
  final String baseUrl = 'https://assessment.eltglobal.in/api/books';

  Future<List<Book>> fetchBooks({String limit = '10'}) async {
    try {
      final url = '$baseUrl?page=1&limit=$limit';
      print('Fetching books from: $url');
      final response = await http.get(Uri.parse(url));

      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        if (response.body.isNotEmpty) {
          final responseData = json.decode(response.body);

          // Ensure 'result' key is not null
          if (responseData is Map<String, dynamic> && responseData.containsKey('result') && responseData['result'] != null) {
            final List<dynamic> booksData = responseData['result'];
            
            // Ensure booksData is a non-null list before mapping
            if (booksData.isNotEmpty) {
              return booksData.map((json) => Book.fromJson(json)).toList();
            } else {
              throw Exception('Books data is empty.');
            }
          } else {
            throw Exception('Books not found in the response.');
          }
        } else {
          throw Exception('Response body is empty.');
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
