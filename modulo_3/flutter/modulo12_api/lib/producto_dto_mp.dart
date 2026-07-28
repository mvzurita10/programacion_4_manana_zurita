class FraseDTO {
  final String content;
  final String author;

  FraseDTO({required this.content, required this.author});

  factory FraseDTO.fromJson(Map<String, dynamic> json) {
    // Soporta APIs tipo ZenQuotes o random quotes
    return FraseDTO(
      content: json['q'] ?? json['content'] ?? 'Respira profundo y encuentra tu centro.',
      author: json['a'] ?? json['author'] ?? 'Sabiduría Interior',
    );
  }
}
