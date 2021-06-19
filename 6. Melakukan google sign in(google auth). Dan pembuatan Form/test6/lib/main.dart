import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'dart:async';

void main() {
  runApp(MyApp());
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = new GoogleSignIn();
bool _isLoggedIn = false;

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
  String nama = "";

  Future<FirebaseUser> _signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    AuthResult authResult = await _auth.signInWithCredential(credential);
    final user = authResult.user;
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);

    setState(() {
      nama = user.displayName;
      _isLoggedIn = true;
    });
    nama = user.displayName;
    print("User Name nya ADALAH: ${user.displayName}");

    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => FormData(
              nama: nama,
            )));
  }

  void signOut() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Center(
        child: new Container(
          width: 300.0,
          child: new RaisedButton(
            onPressed: () => _isLoggedIn
                ? Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => FormData(
                          nama: nama,
                        )))
                : _signIn(),
            color: Colors.blue,
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new Icon(
                  Icons.login,
                  color: Colors.white,
                ),
                new Text("  Login Menggunakan Google",
                    style: new TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class FormData extends StatefulWidget {
  FormData({this.nama});
  String nama;

  @override
  _FormDataState createState() => _FormDataState(namastate: nama);
}

class _FormDataState extends State<FormData> {
  _FormDataState({this.namastate});
  String namastate;

  String _jk = "";

  List<String> agama = ["Islam", "Kristen", "Hindu", "Budha"];

  String _agama = "Islam";

  TextEditingController controllerNama = new TextEditingController();

  TextEditingController controllerPassword = new TextEditingController();

  TextEditingController controllerMoto = new TextEditingController();

  void _pilihjk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void _pilihagama(String value) {
    setState(() {
      _agama = value;
    });
  }

  void _kirimdata() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: [
            new Text("Nama Lengkap : ${controllerNama.text}"),
            new Text("Pass : ${controllerPassword.text}"),
            new Text("Moto : ${controllerMoto.text}"),
            new Text("Jenis kelamin : $_jk"),
            new Text("Agama : $_agama"),
            new RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: new Text("OK"),
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();
    print("User Sign Out");
    _isLoggedIn = false;
    Navigator.of(context)
        .push(new MaterialPageRoute(builder: (BuildContext context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Form Pendaftaran"),
        backgroundColor: Colors.green,
      ),
      body: new ListView(
        children: [
          new Container(
            child: new Padding(
              padding: new EdgeInsets.all(10.0),
              child: new Column(
                children: [
                  new Text("Data Login : ${namastate}"),
                  new TextField(
                    controller: controllerNama,
                    decoration: new InputDecoration(
                        hintText: "Nama Lengkap",
                        labelText: "Masukan Nama",
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        )),
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 5.0)),
                  new TextField(
                    controller: controllerPassword,
                    obscureText: true,
                    decoration: new InputDecoration(
                        hintText: "Password",
                        labelText: "Masukan Password",
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        )),
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 5.0)),
                  new TextField(
                    controller: controllerMoto,
                    maxLines: 3,
                    decoration: new InputDecoration(
                        hintText: "Motto Hidup",
                        labelText: "Masukan Motto Hidup",
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0),
                        )),
                  ),
                  new RadioListTile(
                    value: "Laki-Laki",
                    title: new Text("Laki-Laki"),
                    groupValue: _jk,
                    onChanged: (String value) {
                      _pilihjk(value);
                    },
                    activeColor: Colors.green,
                    subtitle: new Text("Pilih ini jika Laki-Laki"),
                  ),
                  new RadioListTile(
                    value: "Perempaun",
                    title: new Text("Perempuan"),
                    groupValue: _jk,
                    onChanged: (String value) {
                      _pilihjk(value);
                    },
                    subtitle: new Text("Plih ini jika Perempuan"),
                    activeColor: Colors.green,
                  ),
                  new Padding(padding: new EdgeInsets.only(top: 5.0)),
                  new Row(
                    children: [
                      new Text("Pilih Agama  :  "),
                      new DropdownButton(
                        value: _agama,
                        items: agama.map((String value) {
                          return new DropdownMenuItem(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (String value) {
                          _pilihagama(value);
                        },
                      )
                    ],
                  ),
                  new RaisedButton(
                      child: new Text("Kirim"),
                      color: Colors.greenAccent,
                      onPressed: () {
                        _kirimdata();
                      }),
                  new RaisedButton(
                      child: new Text(
                        "Sign Out",
                        style: new TextStyle(color: Colors.white),
                      ),
                      color: Colors.red,
                      onPressed: () => signOutGoogle()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
