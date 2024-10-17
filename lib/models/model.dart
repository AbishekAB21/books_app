class Book {
  final String title;
  final String author;
  final String thumbnail;
  final String price;

  Book({
    required this.title,
    required this.author,
    required this.thumbnail,
    required this.price,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    final volumeInfo = json['volumeInfo'];
    final saleInfo = json['saleInfo'];

    return Book(
      title: volumeInfo['title'] ?? 'No title',
      author:
          (volumeInfo['authors'] != null && volumeInfo['authors'].isNotEmpty)
              ? volumeInfo['authors'][0]
              : 'Unknown author',
      thumbnail: volumeInfo['imageLinks'] != null
          ? volumeInfo['imageLinks']['thumbnail']
          : 'No image available',
      price: saleInfo['listPrice'] != null
          ? '${saleInfo['listPrice']['amount']} ${saleInfo['listPrice']['currencyCode']}'
          : 'Price not available',
    );
  }
}
