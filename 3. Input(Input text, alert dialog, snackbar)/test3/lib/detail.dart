import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambarnya});
  final String nama;
  final String gambarnya;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Ini detail $nama"),
      ),
      body: new Container(
        child: new Center(child: new Image.asset(gambarnya)),
      ),
    );
  }
}
