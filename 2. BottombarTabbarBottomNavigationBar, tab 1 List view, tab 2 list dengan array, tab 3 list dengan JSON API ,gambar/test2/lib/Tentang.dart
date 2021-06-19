import 'package:flutter/material.dart';

class Tentang extends StatelessWidget {
  final List<String> data;

  Tentang({this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: new ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: new Icon(Icons.home),
          title: new Text("${data[index]}"),
        );
      },
    ));
  }
}
