import 'package:flutter/material.dart';
import 'api_service.dart';

class DashboardScreen extends StatefulWidget {
  final String username;

  DashboardScreen({required this.username});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<dynamic> blogPosts = [];

  void _fetchBlogPosts() async {
    try {
      List<dynamic> posts = await ApiService.getBlogPosts();
      setState(() {
        blogPosts = posts;
      });
    } catch (e) {
      // Handle error
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              // Handle menu actions here
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'Profile',
                  child: Text('Profile: ${widget.username}'),
                ),
                PopupMenuItem<String>(
                  value: 'Logout',
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: _fetchBlogPosts,
            child: Text('Fetch Blog Posts'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: blogPosts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(blogPosts[index]['title']),
                  subtitle: Text(blogPosts[index]['author']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
