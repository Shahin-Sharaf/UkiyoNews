import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  final String blogUrl;

  ArticleView({this.blogUrl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  bool isloading;
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isloading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Ukiyo',
          style:
              TextStyle(fontFamily: 'Majesty', color: Colors.red, fontSize: 36),
        ),
        elevation: 0,
      ),
      body: Container(
        child: WebView(
          initialUrl: widget.blogUrl,
          onPageFinished: (_) {
            setState(() {
              isloading = false;
            });
          },
          onWebViewCreated: ((WebViewController webViewController) {
            _completer.complete(webViewController);
          }),
        ),
      ),
    );
  }
}
