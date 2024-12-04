class BlogModel {
  final int id;
  final String title;
  final String summary;
  final String url;
  final String author; // Menambahkan penulis blog
  final String publishedAt; // Menambahkan tanggal publikasi

  BlogModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.url,
    required this.author,
    required this.publishedAt,
  });

  // Mengonversi data JSON ke dalam objek BlogModel
  factory BlogModel.fromJson(Map<String, dynamic> json) {
    return BlogModel(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      url: json['url'],
      author: json['author'] ?? 'Unknown', // Jika author tidak ada, set 'Unknown'
      publishedAt: json['publishedAt'] ?? 'Unknown', // Jika tanggal tidak ada, set 'Unknown'
    );
  }

  // Mengonversi objek BlogModel menjadi format JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'url': url,
      'author': author,
      'publishedAt': publishedAt,
    };
  }
}
