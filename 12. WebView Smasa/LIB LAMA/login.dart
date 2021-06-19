import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("LOGIN",
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
                "http://code.smasa-magetan.sch.id/frontend/index.php/login",
            javascriptMode: JavascriptMode.unrestricted,
          ),
        ));
  }
}
