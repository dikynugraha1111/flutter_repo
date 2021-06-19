import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: Image.asset(
            'img/ARDIAL.png',
            width: 225.0,
          ),
          splashIconSize: 225.0,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.blue[900],
          duration: 3000,
          nextScreen: ArdilaPage()),
    );
  }
}

class ArdilaPage extends StatefulWidget {
  @override
  _ArdilaPageState createState() => _ArdilaPageState();
}

class _ArdilaPageState extends State<ArdilaPage> {
  final FlutterWebviewPlugin webviewPlugin = new FlutterWebviewPlugin();

  void _signOut() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 250.0,
        decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(21),
        ),
        child: new Padding(
          padding: EdgeInsets.all(10),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Image.asset("img/ardialLogo.png"),
              new Divider(),
              Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: new Text("Apakah anda ingin Keluar?")),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                        color: Colors.blue[400],
                        splashColor: Colors.blue[900],
                        child: new Text(
                          "Ya",
                          style: new TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          webviewPlugin.show();
                          SystemNavigator.pop();
                        }),
                    RaisedButton(
                        color: Colors.red[400],
                        splashColor: Colors.red[900],
                        child: new Text(
                          "Tidak",
                          style: new TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          webviewPlugin.show();
                          Navigator.pop(context);
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new WebviewScaffold(
      appBar: new AppBar(
        leading: Image.asset("img/ardialLogo.png"),
        title: Text(
          "ARDIAL",
          style: new TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20.0,
              letterSpacing: 3,
              color: Colors.white),
        ),
        backgroundColor: Colors.blue[900],
        actions: [
          IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              onPressed: () {
                webviewPlugin.hide();
                _signOut();
              })
        ],
      ),
      url: "http://code.smasa-magetan.sch.id/frontend/",
      hidden: true,
    );
  }
}
