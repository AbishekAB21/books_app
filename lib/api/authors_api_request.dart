import 'dart:convert';
import 'package:http/http.dart' as http;

class BooksRepository {
  final String _baseUrl = "https://www.googleapis.com/books/v1/volumes";
  final String _apiKey = "AIzaSyAUye_9iJFjqFA6n6MUL2fVpPJz_SU3k2w"; 

  // Fetching authors 
  Future<List<Map<String, dynamic>>> fetchAuthors(String query) async {
    final response = await http.get(Uri.parse("$_baseUrl?q=$query&key=$_apiKey"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

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
    } else if (response.statusCode == 429) {
      print('Quota exceeded: ${response.body}');
      throw Exception('Rate limit exceeded, please try again later.');
    } else {
      print(response.body);
      throw Exception("Failed to load authors");
    }
  }

  // Adding new author
  void addAuthor(String name, String description, String dob, List<Map<String, dynamic>> authors) {
    authors.add({
      'author': name,
      'description': description,
      'dob': dob,
    });
  }
}
