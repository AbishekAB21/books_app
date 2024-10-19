class Book {
  final String id;
  final String imageUrl;
  final String title;
  final String author;
  final double price;
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
      id: json['id'] ?? '', // Default to empty string if id is null
      imageUrl: json['coverPictureURL'] ?? 'https://default-image-url.com', // Use default image URL if null
      title: json['title'] ?? 'Untitled', // Default title if null
      author: json['authorId'] ?? 'Unknown Author', // Default author if null
      price: (json['price'] != null) ? (json['price'] as num).toDouble() : 0.0, // Default price if null
      description: json['description'] ?? 'No description available.', // Default description if null
    );
  }
}
