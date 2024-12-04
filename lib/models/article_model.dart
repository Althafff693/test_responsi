class ArticleModel {
  final int id;
  final String title;
  final String summary;
  final String url;

  ArticleModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.url,
  });

  // Mengonversi data JSON ke dalam objek ArticleModel
  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      url: json['url'],
    );
  }

  // Mengonversi objek ArticleModel menjadi format JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'url': url,
    };
  }
}
