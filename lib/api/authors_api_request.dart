import 'dart:convert';
import 'package:http/http.dart' as http;

class BooksRepository {
  final String _baseUrl = "https://www.googleapis.com/books/v1/volumes";

  Future<List<Map<String, dynamic>>> fetchAuthors(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl?q=$query"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      // Safely map over the list of books, handling null or missing fields
      final List<Map<String, dynamic>> authors = (data['items'] ?? [])
          .map<Map<String, dynamic>>((book) => {
                'title': book['volumeInfo']['title'] ?? 'No title available',
                'author': (book['volumeInfo']['authors'] != null)
                    ? book['volumeInfo']['authors'].join(", ")
                    : 'Unknown Author',
                'description': book['volumeInfo']['description'] ?? 'No description available',
              })
          .toList();

      return authors;
    } else {
      throw Exception("Failed to load authors");
    }
  }
}
