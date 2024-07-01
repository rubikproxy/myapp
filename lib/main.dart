import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'dashboard_screen.dart';
import 'blog_posts_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginScreen(
          onLoginSuccess: (username) {
            Navigator.pushReplacementNamed(
              context,
              '/dashboard',
              arguments: username,
            );
          },
        ),
        '/dashboard': (context) {
          final username = ModalRoute.of(context)!.settings.arguments as String;
          return DashboardScreen(username: username);
        },
        '/blogposts': (context) => BlogPostsScreen(),
      },
    );
  }
}
