import 'dart:convert';
import 'package:http/http.dart' as http;

class BooksRepository {
  final String _baseUrl = "https://assessment.eltglobal.in/api/authors";

  Future<List<Map<String, dynamic>>> fetchAuthors() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<Map<String, dynamic>> authors = (data['result'] ?? [])
          .map<Map<String, dynamic>>((author) => {
                'id': author['id'],
                'name': author['name'],
                'birthdate': author['birthdate'],
                'biography': author['biography'],
              })
          .toList();

      return authors;
    } else {
      print(response.body);
      throw Exception("Failed to load authors");
    }
  }

  Future<void> addAuthor(String name, String biography, String dob) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "name": name,
        "birthdate": dob,
        "biography": biography,
      }),
    );

    if (response.statusCode == 201) {
      print("Author added successfully!");
    } else {
      print("Failed to add author: ${response.statusCode} - ${response.body}");
      throw Exception("Failed to add author");
    }
  }

  // Add this method to delete an author
  Future<void> deleteAuthor(String authorId) async {
    final response = await http.delete(
      Uri.parse("$_baseUrl/$authorId"),
    );

    if (response.statusCode != 200) {
      print("Failed to delete author: ${response.statusCode} - ${response.body}");
      throw Exception("Failed to delete author");
    }
  }
}
