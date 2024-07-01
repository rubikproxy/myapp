import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://api.vinsanjay.me/api';

  static Future<List<dynamic>> getBlogPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/blog-posts'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load blog posts');
    }
  }

  static Future<void> createBlogPost(Map<String, dynamic> data) async {
    final response = await http.post(
      Uri.parse('$baseUrl/blog-posts'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(data),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to create blog post');
    }
  }

  // Add more methods for update, delete, etc.
}
