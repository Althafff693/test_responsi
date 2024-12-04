import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/article_model.dart';
import '../models/blog_model.dart';
import '../models/report_model.dart';

class ApiService {
  // URL dasar API
  static const String _baseUrl = 'https://api.spaceflightnewsapi.net/v4/';

  // Fungsi untuk mengambil data News
  Future<List<ArticleModel>> fetchArticles() async {
    final url = Uri.parse('${_baseUrl}articles/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((item) => ArticleModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }

  // Fungsi untuk mengambil data Blogs
  Future<List<BlogModel>> fetchBlogs() async {
    final url = Uri.parse('${_baseUrl}blogs/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((item) => BlogModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load blogs');
    }
  }

  // Fungsi untuk mengambil data Reports
  Future<List<ReportModel>> fetchReports() async {
    final url = Uri.parse('${_baseUrl}reports/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      return data.map((item) => ReportModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load reports');
    }
  }

  // Fungsi untuk mengambil detail dari News, Blog, atau Report
  Future<dynamic> fetchDetail(String category, int id) async {
    final url = Uri.parse('${_baseUrl}$category/$id/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load detail');
    }
  }
}
