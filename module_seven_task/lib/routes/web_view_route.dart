import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewRoute extends StatefulWidget{

  @override
  _WebViewRouteState createState() => _WebViewRouteState();
}

class _WebViewRouteState extends State<WebViewRoute> {

  bool _isLoaded = false;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: _isLoaded ? 0 : 1,
      children: [
        WebView(
          initialUrl: "https://flutter.dev/",
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: _handlePageLoaded,
        ),
        Center(
            child: CircularProgressIndicator()
        )
      ],
    );
  }

  void _handlePageLoaded(String url) {
    setState(() {
      _isLoaded = true;
    });
  }
}