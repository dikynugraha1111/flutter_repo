import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArdilaPage extends StatefulWidget {
  @override
  _ArdilaPageState createState() => _ArdilaPageState();
}

class _ArdilaPageState extends State<ArdilaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("ARDIAL",
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
            initialUrl: "http://code.smasa-magetan.sch.id/frontend/",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
