class Author {
  final String id;
  final String name;
  final String birthdate;
  final String biography;

  Author({
    required this.id,
    required this.name,
    required this.birthdate,
    required this.biography,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'] ?? '',
      name: json['name'] ?? 'Unknown name',
      birthdate: json['birthdate'] ?? 'Unknown birthdate',
      biography: json['biography'] ?? 'No biography available',
    );
  }
}
