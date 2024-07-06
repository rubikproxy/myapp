import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  double sliderValue = 0.5;
  String dropdownValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'General Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text('Enable Notifications'),
              value: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Customization',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Notification Volume'),
            Slider(
              value: sliderValue,
              min: 0.0,
              max: 1.0,
              divisions: 10,
              onChanged: (value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Select Option'),
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Option 1', 'Option 2', 'Option 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Other Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ListTile(
              title: Text('Account Settings'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to account settings screen
              },
            ),
            ListTile(
              title: Text('Privacy Settings'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to privacy settings screen
              },
            ),
            ListTile(
              title: Text('Help & Support'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to help & support screen
              },
            ),
          ],
        ),
      ),
    );
  }
}

