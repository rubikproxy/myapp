import 'package:flutter/material.dart';
import 'about_screen.dart';
import 'blog_posts_screen.dart';
import 'settings_screen.dart'; // Import your SettingsScreen

class DashboardScreen extends StatefulWidget {
  final String username;

  DashboardScreen({required this.username});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Logout') {
                Navigator.pushReplacementNamed(context, '/');
              }
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text(widget.username),
              accountEmail: Text('hello.vinsanjay.me'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.deepPurple,
                child: Text(
                  widget.username[0],
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
            ListTile(
              leading: Icon(Icons.article, color: Colors.deepPurpleAccent),
              title: Text('Blog Posts'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BlogPostsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work, color: Colors.deepPurpleAccent),
              title: Text('Portfolio'),
              onTap: () {
                Navigator.pushNamed(context, '/portfolio');
              },
            ),
            ListTile(
              leading: Icon(Icons.api, color: Colors.deepPurpleAccent),
              title: Text('API Index'),
              onTap: () {
                Navigator.pushNamed(context, '/api-index');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.deepPurpleAccent),
              title: Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.deepPurpleAccent),
              title: Text('About'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.deepPurpleAccent),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to the Dashboard!',
          style: TextStyle(fontSize: 24, color: Colors.deepPurpleAccent),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
