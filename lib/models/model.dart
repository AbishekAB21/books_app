


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
      id: json['id'],
      imageUrl: json['coverPictureURL'], 
      title: json['title'],
      author: json['authorId'],
      price: (json['price'] as num).toDouble(),
      description: json['description'],
    );
  }
}
