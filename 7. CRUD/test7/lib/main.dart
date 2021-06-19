import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
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
  TextEditingController controlleruserId = new TextEditingController();
  TextEditingController controllertitle = new TextEditingController();
  TextEditingController controllerbody = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();
  void _snackbar() {
    _scaffoldState.currentState.showSnackBar(new SnackBar(
      content: new Text("Data Berhasil Dikirim"),
      duration: new Duration(seconds: 3),
    ));
  }

  Future<List> _getData() async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/users");
    return json.decode(response.body);
  }

  void addData() {
    var url = "https://jsonplaceholder.typicode.com/posts";

    http.post(url, body: {
      "userId": controlleruserId.text,
      "title": controllertitle.text,
      "body": controllerbody.text
    });
  }

  void _alertDialog() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Column(
        children: [
          new TextField(
              controller: controlleruserId,
              decoration: new InputDecoration(
                  hintText: "User Id", labelText: "User Id")),
          new TextField(
              controller: controllertitle,
              decoration:
                  new InputDecoration(hintText: "title", labelText: "title")),
          new TextField(
              controller: controllerbody,
              decoration:
                  new InputDecoration(hintText: "body", labelText: "body"))
        ],
      ),
      actions: [
        new RaisedButton(
          onPressed: () {
            addData();
            controlleruserId.text = "";
            controllertitle.text = "";
            controllerbody.text = "";
            Navigator.pop(context);
          },
          color: Colors.blueAccent,
          child: new Text("Tambah Data"),
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Test 7")),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          _alertDialog();
        },
        child: new Icon(Icons.add),
      ),
      body: new FutureBuilder(
          future: _getData(),
          builder: (context, webService) {
            if (webService.hasError) print(webService.error);

            return webService.hasData
                ? new Itemlist(
                    list: webService.data,
                  )
                : new Center(child: new CircularProgressIndicator());
          }),
    );
  }
}

class Itemlist extends StatelessWidget {
  List list;
  Itemlist({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          padding: EdgeInsets.all(5.0),
          child: new GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(new MaterialPageRoute(builder: (BuildContext context) {
                return new ItemDetail(
                  detailName: list[i]["name"],
                  detailZip: list[i]["address"]["zipcode"],
                  id: list[i]["id"],
                );
              }));
            },
            child: new Card(
              child: new ListTile(
                title: new Text(list[i]["name"]),
                leading: new Icon(Icons.data_usage),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ItemDetail extends StatefulWidget {
  ItemDetail({this.detailName, this.detailZip, this.id});
  String detailZip = "";
  String detailName = "";
  int id;

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  void alertDelete(id, nama) {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text("Apakah yakin menghapus data dari ${nama} ?"),
      actions: [
        new RaisedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.green,
            child: new Text(
              "Tidak",
              style: new TextStyle(color: Colors.white),
            )),
        new RaisedButton(
          onPressed: () {
            deleteData(id);
            Navigator.of(context)
                .push(new MaterialPageRoute(builder: (BuildContext context) {
              return new Home();
            }));
          },
          color: Colors.red,
          child: new Text(
            "Iya",
            style: new TextStyle(color: Colors.white),
          ),
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  void deleteData(id) {
    var url = "https://jsonplaceholder.typicode.com/users/${id}";
    http.delete(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text("Test 7 Detail")),
      body: new Container(
        padding: new EdgeInsets.all(10.0),
        height: 250.0,
        child: new Center(
          child: new Card(
            child: new Center(
              child: new Column(
                children: [
                  new Padding(padding: EdgeInsets.only(top: 30.0)),
                  new Text(widget.detailName),
                  new Text(widget.detailZip),
                  new Text(widget.id.toString()),
                  new Padding(padding: EdgeInsets.only(bottom: 30.0)),
                  new Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      new RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) {
                              return new EditData(
                                detailName: widget.detailName,
                                detailZip: widget.detailZip,
                                id: widget.id,
                              );
                            }));
                          },
                          color: Colors.green,
                          child: new Center(
                            child: new Text("Edit"),
                          )),
                      new Padding(padding: EdgeInsets.only(right: 5.0)),
                      new RaisedButton(
                          onPressed: () {
                            return alertDelete(widget.id, widget.detailName);
                          },
                          color: Colors.red,
                          child: new Center(
                            child: new Text("Delete"),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class EditData extends StatefulWidget {
  EditData({this.detailName, this.detailZip, this.id});
  String detailZip = "";
  String detailName = "";
  int id;

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controlleruserIdBaru;
  TextEditingController controllertitleBaru;
  TextEditingController controllerbodyBaru;

  @override
  void initState() {
    controlleruserIdBaru =
        new TextEditingController(text: widget.id.toString());
    controllertitleBaru = new TextEditingController(text: widget.detailName);
    controllerbodyBaru = new TextEditingController(text: widget.detailZip);
    super.initState();
  }

  void editData() {
    var url = "https://jsonplaceholder.typicode.com/users";

    http.put(url, body: {
      "id": int.parse(controlleruserIdBaru.text),
      "name": controllertitleBaru.text,
      "zipcode": controllerbodyBaru.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("EDIT"),
        ),
        body: new Container(
          child: new Column(
            children: [
              new TextField(
                  controller: controlleruserIdBaru,
                  decoration: new InputDecoration(
                      hintText: "User Id", labelText: "User Id")),
              new TextField(
                  controller: controllertitleBaru,
                  decoration: new InputDecoration(
                      hintText: "title", labelText: "title")),
              new TextField(
                  controller: controllerbodyBaru,
                  decoration:
                      new InputDecoration(hintText: "body", labelText: "body")),
              new RaisedButton(
                onPressed: () {
                  editData();
                  Navigator.of(context).push(
                      new MaterialPageRoute(builder: (BuildContext context) {
                    return new Home();
                  }));
                },
                color: Colors.blue,
                child: new Text("EDIT"),
              )
            ],
          ),
        ));
  }
}
