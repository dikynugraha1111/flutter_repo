import 'package:flutter/material.dart';
import 'package:test3/detail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test 3',
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
  String teks = "";

  TextEditingController controller1 = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();

  bool snack = false;

  String gambar1 = "img/diky.jpg";
  String gambar2 = "img/kocengoren.jpg";
  String backup;

  String nama1 = "DikyPro";
  String nama2 = "KocengOren";
  String backupnama;
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  void _alertdialog(String str) {
    if (str.isEmpty) {
      return;
    }
    AlertDialog alertDialog = new AlertDialog(
      
      content: new Column(children: [new Text(str)]),
      actions: [
        new RaisedButton(
            color: Colors.blue,
            child: new Text("Submit"),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );

    showDialog(context: context, child: alertDialog);
  }

  void _snackbar(String str) {
    if (str.isEmpty) {
      return;
    }

    _scaffoldState.currentState.showSnackBar(new SnackBar(
      content: new Text(str),
      duration: new Duration(seconds: 3),
    ));
  }

  void gantiuser() {
    this.setState(() {
      backup = gambar1;
      gambar1 = gambar2;
      gambar2 = backup;

      backupnama = nama1;
      nama1 = nama2;
      nama2 = backupnama;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: new AppBar(
        title: new Text("Ini testing 3"),
      ),
      drawer: new Drawer(
          child: new ListView(
        children: [
          new UserAccountsDrawerHeader(
            accountName: new Text(
              nama1,
              style: new TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 20.0),
            ),
            accountEmail: new Text("Diky@gmail.com"),
            currentAccountPicture: new GestureDetector(
                onTap: () {
                  return Navigator.of(context).push(
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new Detail(
                      nama: nama1,
                      gambarnya: gambar1,
                    );
                  }));
                },
                child: new CircleAvatar(backgroundImage: AssetImage(gambar1))),
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: new NetworkImage(
                    "https://swapps.com/wp-content/uploads/2018/07/trying-out-flutter.jpg",
                  ),
                  fit: BoxFit.cover),
            ),
            otherAccountsPictures: [
              new GestureDetector(
                onTap: () {
                  gantiuser();
                },
                child: new CircleAvatar(
                  backgroundImage: new AssetImage(gambar2),
                ),
              )
            ],
          ),
          new ListTile(
            title: new Text("Setting"),
            trailing: new Icon(Icons.settings),
          ),
          new ListTile(
            title: new Text("LogOut"),
            trailing: new Icon(Icons.logout),
          ),
        ],
      )),
      body: new Container(
        child: new Column(
          children: [
            new TextField(
              controller: controller1,
              decoration:
                  new InputDecoration(hintText: "Masukan inputan di sini..."),
              onSubmitted: (String str) {
                setState(() {
                  teks = str;
                  controller1.text = "";
                });
              },
            ),
            new Text(teks),
            new TextField(
              controller: controller2,
              decoration: new InputDecoration(
                  hintText: "Masukan alert dialog di sini..."),
              onSubmitted: (String str) {
                setState(() {
                  _alertdialog(str);
                  controller2.text = "";
                });
              },
            ),
            new TextField(
              controller: controller3,
              decoration:
                  new InputDecoration(hintText: "Masukan snackbar di sini..."),
              onSubmitted: (String str) {
                setState(() {
                  _snackbar(str);
                  controller3.text = "";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
