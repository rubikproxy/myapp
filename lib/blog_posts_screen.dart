import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog Posts'),
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
                        onTap: () {
                          // Navigate to detailed view of the blog post
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
                          padding: EdgeInsets.all(15.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
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
                              Text(
                                'by ${blogPosts[index]['author']}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                'Date: ${blogPosts[index]['date']}',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[400],
                                ),
                              ),
                              SizedBox(height: 12.0),
                              Text(
                                blogPosts[index]['content'],
                                style: TextStyle(fontSize: 16.0),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: 12.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      // Implement Edit functionality
                                    },
                                    child: Text(
                                      'Edit',
                                      style: TextStyle(color: Colors.orange),
                                    ),
                                  ),
                                  SizedBox(width: 10.0),
                                  TextButton(
                                    onPressed: () {
                                      // Implement Delete functionality
                                    },
                                    child: Text(
                                      'Delete',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
