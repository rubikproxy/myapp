import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ApiIndexScreen extends StatefulWidget {
  @override
  _ApiIndexScreenState createState() => _ApiIndexScreenState();
}

class _ApiIndexScreenState extends State<ApiIndexScreen> {
  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Index'),
        backgroundColor: Colors.deepPurple,
      ),
      body: WebView(
        initialUrl: 'https://api.vinsanjay.me',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
