class ReportModel {
  final int id;
  final String title;
  final String summary;
  final String url;

  ReportModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.url,
  });

  // Mengonversi data JSON ke dalam objek ReportModel
  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      id: json['id'],
      title: json['title'],
      summary: json['summary'],
      url: json['url'],
    );
  }

  // Mengonversi objek ReportModel menjadi format JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'summary': summary,
      'url': url,
    };
  }
}
