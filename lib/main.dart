import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'dashboard_screen.dart';
import 'blog_posts_screen.dart';
import 'about_screen.dart'; // Import your AboutScreen
import 'api_index.dart'; // Import your ApiIndexScreen
// import 'settings_screen.dart';
import 'portoflio.dart';

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
        '/api-index': (context) => ApiIndexScreen(), // Route for ApiIndexScreen
        '/about': (context) => AboutScreen(), // Route for AboutScreen
        // '/settings': (context) => SettingsScreen(),
        '/portfolio': (context) => Portoflio()
      },
    );
  }
}
