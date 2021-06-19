import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebSmasaPage extends StatefulWidget {
  @override
  _WebSmasaPageState createState() => _WebSmasaPageState();
}

class _WebSmasaPageState extends State<WebSmasaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("WEBSMASA",
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
            initialUrl: "https://www.smasa-magetan.sch.id/",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
