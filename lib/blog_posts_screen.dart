import 'package:flutter/material.dart';
import 'api_service.dart';

class BlogPostsScreen extends StatefulWidget {
  @override
  _BlogPostsScreenState createState() => _BlogPostsScreenState();
}

class _BlogPostsScreenState extends State<BlogPostsScreen> {
  List<dynamic> blogPosts = [];

  @override
  void initState() {
    super.initState();
    _fetchBlogPosts();
  }

  void _fetchBlogPosts() async {
    try {
      List<dynamic> posts = await ApiService.getBlogPosts();
      setState(() {
        blogPosts = posts;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Posts'),
      ),
      body: blogPosts.isEmpty
          ? Center(
              child: Text(
                'No blog posts available.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            )
          : ListView.builder(
              itemCount: blogPosts.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                  child: ListTile(
                    leading: Icon(Icons.article, color: Colors.deepPurple),
                    title: Text(blogPosts[index]['title']),
                    subtitle: Text('by ${blogPosts[index]['author']}'),
                  ),
                );
              },
            ),
    );
  }
}
