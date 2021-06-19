import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(new MaterialApp(
    home: new HelloWorld(),
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => new HelloWorld(),
      '/setting': (BuildContext context) => new Settings(),
    },
  ));
}

class HelloWorld extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[800],
        leading: new Icon(Icons.home),
        title: new Center(
          child: new Text("App One"),
        ),
        actions: [new Icon(Icons.search)],
      ),
      body: new Container(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NavIcon(
              iconnya: Icons.home,
              warna: Colors.orange[800],
              teks: "Home",
              tujuan: null,
            ),
            NavIcon(
              iconnya: Icons.favorite,
              warna: Colors.pink,
              teks: "Favorite",
              tujuan: null,
            ),
            NavIcon(
              iconnya: Icons.settings,
              warna: Colors.black,
              teks: "Settings",
              tujuan: '/setting',
            ),
            NavIcon(
              iconnya: Icons.logout,
              warna: Colors.red,
              teks: "LogOut",
              tujuan: null,
            ),
          ],
        ),
      ),
    );
  }
}

class NavIcon extends StatelessWidget {
  NavIcon({this.iconnya, this.warna, this.teks, this.tujuan});
  final IconData iconnya;
  final Color warna;
  final String teks;
  final String tujuan;
  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.all(7.0),
      child: 
      new Card(
        child: new Column(
          children: [
            new IconButton(
                icon: new Icon(
                  iconnya,
                  color: warna,
                  size: 33.0,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, tujuan);
                }),
            new Text(
              teks,
              style: new TextStyle(
                fontSize: 20.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Halaman Setting
class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.orange[800],
        title: new Center(
          child: new Text("App One"),
        ),
        actions: [new Icon(Icons.search)],
      ),
      body: new Center(
        child: new Text("Ini merupakan Halaman Setting"),
      ),
    );
  }
}
