import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ArdilaPage(),
    );
  }
}

class ArdilaPage extends StatefulWidget {
  @override
  _ArdilaPageState createState() => _ArdilaPageState();
}

class _ArdilaPageState extends State<ArdilaPage> {
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: new AppBar(
        title: new Text("ARDIAL",
            style: new TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 25.0)),
        centerTitle: true,
        backgroundColor: Colors.blue[800],
      ),
      url: "http://code.smasa-magetan.sch.id/frontend/",
      hidden: true,
    );
  }
}
