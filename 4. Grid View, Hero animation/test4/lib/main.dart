import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert' show json;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Container> daftarhp = new List();
  List<Container> daftarJson = new List();
  List dataJSON;

  ambildata() sync* {
    http.Response hasil = http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/users"),
        headers: {"Accept": "application/json"}) as http.Response;

    this.setState(() {
      dataJSON = json.decode(hasil.body);
    });
  }

  var hp = [
    {"nama": "redmi8", "gambar": "redmi8.jpg"},
    {"nama": "redmi9", "gambar": "redmi9.jpg"},
    {"nama": "redminote2", "gambar": "redminote2.jpg"},
    {"nama": "redminote3", "gambar": "redminote3.jpg"},
    {"nama": "redminote4", "gambar": "redminote4.jpg"},
    {"nama": "redminote5", "gambar": "redminote5.jpg"},
    {"nama": "redminote6", "gambar": "redminote6.jpg"},
    {"nama": "redminote7", "gambar": "redminote7.jpg"},
    {"nama": "redminote8", "gambar": "redminote8.jpg"},
  ];

  _buatlist() async {
    ambildata();
    var data = ambildata();
    for (var i = 0; i < hp.length; i++) {
      final hpnya = hp[i];
      daftarhp.add(new Container(
        padding: EdgeInsets.all(10.0),
        child: new Card(
          child: new Column(
            children: [
              new Expanded(
                child: new Hero(
                    tag: hpnya["nama"],
                    child: new Material(
                        child: new InkWell(
                      onTap: () {
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => new Detail(
                                  nama: hpnya["nama"],
                                  gambar: hpnya["gambar"],
                                )));
                      },
                      child: new Image.asset("img/" + hpnya["gambar"],
                          fit: BoxFit.cover),
                    ))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new Text(
                  dataJSON == null ? "kosong" : dataJSON[i]["name"],
                  style: new TextStyle(fontSize: 15.0),
                ),
              )
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() {
    this.ambildata();
    ambildata();
    _buatlist();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Grid view"),
      ),
      body: new GridView.count(crossAxisCount: 2, children: daftarhp),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nama, this.gambar});
  final String nama;
  final String gambar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Grid view"),
      ),
      body: new ListView(
        children: [
          new Row(children: [
            new Expanded(
              child: new Center(
                child: new Hero(
                  tag: nama,
                  child: ClipOval(
                    child: SizedBox(
                      width: 240.0,
                      height: 240.0,
                      child: new Material(
                        child: new InkWell(
                          child: new Image.asset(
                            "img/" + gambar,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
          new BagianJudul(
            nama: nama,
          ),
        ],
      ),
    );
  }
}

class BagianJudul extends StatelessWidget {
  BagianJudul({this.nama});
  final String nama;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Row(
        children: [
          new Expanded(
            child: new Padding(
              padding: EdgeInsets.all(15.0),
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    new Text(nama,
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.blue,
                            fontWeight: FontWeight.w700)),
                    new Text(nama + "\@google.com",
                        style: new TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey))
                  ]),
            ),
          ),
          new Padding(
            padding: EdgeInsets.all(10.0),
            child: new Row(
              children: [
                new Icon(
                  Icons.star,
                  size: 20.0,
                ),
                new Text("Cool")
              ],
            ),
          )
        ],
      ),
    );
  }
}
