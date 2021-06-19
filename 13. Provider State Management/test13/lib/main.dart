import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test13/mainProvideController.dart';
import 'package:test13/multiProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainProvideController>(
      create: (context) => MainProvideController(),
      child: Scaffold(
        appBar: new AppBar(
            title: new Consumer<MainProvideController>(
              builder: (context, mainProvideController, _) => new Text(
                  "Provider State Management",
                  style: new TextStyle(color: mainProvideController.color)),
            ),
            backgroundColor: Colors.white),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Consumer<MainProvideController>(
                builder: (context, mainProvideController, _) =>
                    new AnimatedContainer(
                        width: 100,
                        height: 100,
                        color: mainProvideController.color,
                        duration: Duration(milliseconds: 500)),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Container(
                      margin: EdgeInsets.all(5.0), child: new Text("Black")),
                  new Consumer<MainProvideController>(
                    builder: (context, mainProvideController, _) => new Switch(
                      value: mainProvideController.isBlue,
                      onChanged: (newValue) {
                        mainProvideController.isBlue = newValue;
                      },
                    ),
                  ),
                  new Container(
                      margin: EdgeInsets.all(5.0), child: new Text("Blue")),
                ],
              ),
              new RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => new MultiProvide()));
                },
                child: new Text("Multi Provider"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
