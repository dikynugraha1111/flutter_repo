import 'package:flutter/material.dart';

class Hometab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DataCard(
          iconnya: Icons.home,
          namanya: "Home",
          tujuan: null,
        ),
        DataCard(
          iconnya: Icons.computer,
          namanya: "Laptop",
          tujuan: null,
        ),
        DataCard(
          iconnya: Icons.smartphone,
          namanya: "Handphone",
          tujuan: "/handphone",
        ),
        DataCard(
          iconnya: Icons.home,
          namanya: "Home",
          tujuan: null,
        ),
        DataCard(
          iconnya: Icons.computer,
          namanya: "Laptop",
          tujuan: null,
        ),
        DataCard(
          iconnya: Icons.smartphone,
          namanya: "Handphone",
          tujuan: "/handphone",
        ),
        DataCard(
          iconnya: Icons.home,
          namanya: "Home",
          tujuan: null,
        ),
        DataCard(
          iconnya: Icons.computer,
          namanya: "Laptop",
          tujuan: null,
        ),
        DataCard(
          iconnya: Icons.smartphone,
          namanya: "Handphone",
          tujuan: "/handphone",
        ),
        DataCard(
          iconnya: Icons.home,
          namanya: "Home",
          tujuan: null,
        ),
        DataCard(
          iconnya: Icons.computer,
          namanya: "Laptop",
          tujuan: null,
        ),
        DataCard(
          iconnya: Icons.smartphone,
          namanya: "Handphone",
          tujuan: "/handphone",
        ),
      ],
    );
  }
}

class DataCard extends StatelessWidget {
  DataCard({this.iconnya, this.namanya, this.tujuan});
  final IconData iconnya;
  final String namanya;
  final String tujuan;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(3.0),
      child: new Card(
        child: new Row(
          children: [
            new IconButton(
              icon: new Icon(
                iconnya,
                color: Colors.black,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.pushNamed(context, tujuan);
              },
            ),
            new Container(
              padding: new EdgeInsets.all(11.0),
              child: new Text(
                namanya,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Handphone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.brown[700],
        title: new Center(
          child: new Text("Handphone"),
        ),
        actions: [new Icon(Icons.search)],
      ),
      body: new Center(
        child: new Image.asset("/img/kocengoren.jpg"),
      ),
    );
  }
}
