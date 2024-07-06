import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Portoflio extends StatefulWidget {
  @override
  _PortoflioState createState() => _PortoflioState();
}

class _PortoflioState extends State<Portoflio> {
  @override
  void initState() {
    super.initState();
    WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Portfolio'),
        backgroundColor: Colors.deepPurple,
      ),
      body: WebView(
        initialUrl: 'https://vinsanjay.me',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
