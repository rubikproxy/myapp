import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
        backgroundColor: Colors.deepPurple,
      ),
      backgroundColor: Colors.black, // Set the background color to dark black
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'This is the About Screen',
              style: TextStyle(fontSize: 24, color: Colors.white), // Set text color to white
            ),
            SizedBox(height: 20),
            Text(
              'Add your about content here.',
              style: TextStyle(fontSize: 16, color: Colors.white70), // Set text color to a lighter shade of white
            ),
          ],
        ),
      ),
    );
  }
}
