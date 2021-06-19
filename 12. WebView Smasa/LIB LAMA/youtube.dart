import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YoutubePage extends StatefulWidget {
  @override
  _YoutubePageState createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("YOUTUBE",
              style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 25.0)),
          centerTitle: true,
          backgroundColor: Colors.blue[800],
        ),
        body: new ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 1000000),
          child: WebView(
            initialUrl:
                "https://m.youtube.com/channel/UCzfW6gMTO61hSkVQ8D0g_7w",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
