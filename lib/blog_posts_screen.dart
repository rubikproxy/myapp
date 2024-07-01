import 'package:flutter/material.dart';
import 'dart:ui';
import 'api_service.dart';

class BlogPostsScreen extends StatefulWidget {
  @override
  _BlogPostsScreenState createState() => _BlogPostsScreenState();
}

class _BlogPostsScreenState extends State<BlogPostsScreen> {
  List<dynamic> blogPosts = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchBlogPosts();
  }

  Future<void> _fetchBlogPosts() async {
    setState(() {
      isLoading = true;
    });

    try {
      List<dynamic> posts = await ApiService.getBlogPosts();
      setState(() {
        blogPosts = posts;
        isLoading = false;
      });
    } catch (e) {
      print(e);
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> _refreshBlogPosts() async {
    await _fetchBlogPosts();
  }

  void _showEditDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            title: Text('Edit or Delete'),
            content: Text('Would you like to edit or delete this post?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Implement your edit functionality here
                },
                child: Text('Edit'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // Implement your delete functionality here
                },
                child: Text('Delete'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Posts'),
        backgroundColor: Color.fromARGB(255, 220, 186, 241),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshBlogPosts,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : blogPosts.isEmpty
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
                      return GestureDetector(
                        onLongPress: () {
                          _showEditDeleteDialog(index);
                        },
                        child: Card(
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  blogPosts[index]['title'],
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'by ${blogPosts[index]['author']}',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.grey[600],
                                      ),
                                    ),
                                    Text(
                                      blogPosts[index]['date'],
                                      style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12.0),
                                Text(
                                  blogPosts[index]['content'],
                                  style: TextStyle(fontSize: 16.0),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
