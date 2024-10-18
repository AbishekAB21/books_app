import 'package:intl/intl.dart'; // Import for currency formatting

// Book Model
class Book {
  final String id; // Add id for consistency with the API
  final String imageUrl;
  final String title;
  final String author;
  final double price; // Use double for price
  final String description;

  Book({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.price,
    required this.description,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      imageUrl: json['coverPictureURL'], // Adjust to the correct key
      title: json['title'],
      author: json['authorId'], // Adjust if author is defined differently in the response
      price: (json['price'] as num).toDouble(),
      description: json['description'],
    );
  }
}
