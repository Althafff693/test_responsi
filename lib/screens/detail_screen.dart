import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DetailScreen extends StatefulWidget {
  final String category; // Kategori data: report, blog, atau news
  final int id; // ID item yang dipilih

  const DetailScreen({Key? key, required this.category, required this.id})
      : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Map<String, dynamic>? _detailData;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchDetailData();
  }

  Future<void> _fetchDetailData() async {
    final url =
        'https://api.spaceflightnewsapi.net/v4/${widget.category}/${widget.id}/';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          _detailData = json.decode(response.body);
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load detail data');
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.toUpperCase()),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _detailData == null
              ? Center(child: Text('Data tidak tersedia'))
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _detailData!['title'] ?? 'No Title',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        _detailData!['summary'] ?? 'No Summary',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          final url = _detailData!['url'];
                          if (url != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    WebViewScreen(url: url),
                              ),
                            );
                          }
                        },
                        child: Text('Buka Artikel'),
                      ),
                    ],
                  ),
                ),
    );
  }
}

class WebViewScreen extends StatelessWidget {
  final String url;

  const WebViewScreen({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Web View'),
      ),
      body: Center(
        child: Text('Webview akan diimplementasikan di sini!'),
      ),
    );
  }
}
