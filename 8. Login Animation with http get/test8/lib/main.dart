import 'package:flutter/material.dart';
import 'package:test8/LoginAnimation.dart';
import 'LoginAnimation.dart';
import 'package:flutter/scheduler.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var statusClick = false;
  String msg = "";

  TextEditingController textEditingControllerUser;
  TextEditingController textEditingControllerPass;

  AnimationController animationControllerButton;

  @override
  void initState() {
    textEditingControllerUser = new TextEditingController(text: '');
    textEditingControllerPass = new TextEditingController(text: '');
    // TODO: implement initState
    super.initState();
    animationControllerButton =
        new AnimationController(duration: Duration(seconds: 3), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.dismissed) {
              setState(() {
                statusClick = false;
                msg = "Username atau Password Salah";
              });
            }
          });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationControllerButton.dispose();
  }

  Future<Null> _playAnimation() async {
    try {
      await animationControllerButton.forward();
      await animationControllerButton.reverse();
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        decoration: new BoxDecoration(
            image: new DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.6), BlendMode.dstOut),
          image: AssetImage('img/welcome.png'),
          fit: BoxFit.cover,
        )),
        child: new ListView(
          padding: const EdgeInsets.all(0.0),
          children: [
            new Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                new Column(
                  children: [
                    new Padding(padding: const EdgeInsets.only(top: 280.0)),
                    new Container(
                      padding: const EdgeInsets.all(30.0),
                      child: new Column(
                        children: [
                          new Padding(padding: const EdgeInsets.all(18.0)),
                          new TextField(
                              controller: textEditingControllerUser,
                              decoration: new InputDecoration(
                                icon: new Icon(
                                  Icons.person_outline,
                                  color: Colors.blue[600],
                                  size: 45.0,
                                ),
                                hintText: "Username",
                              )),
                          new Padding(padding: const EdgeInsets.all(18.0)),
                          new TextField(
                              controller: textEditingControllerPass,
                              obscureText: true,
                              decoration: new InputDecoration(
                                icon: new Icon(
                                  Icons.lock_outline,
                                  color: Colors.blue[600],
                                  size: 45.0,
                                ),
                                hintText: "Password",
                              )),
                          new Padding(padding: EdgeInsets.only(top: 5.0)),
                          new Text(
                            msg,
                            style: new TextStyle(
                                color: Colors.red, fontSize: 18.0),
                          ),
                          new FlatButton(
                              padding: EdgeInsets.only(top: 310.0),
                              onPressed: () {},
                              child: new Text(
                                  "Gak punya Akun? Daftar Disini...",
                                  style: new TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 0.5))),
                        ],
                      ),
                    )
                  ],
                ),
                statusClick == false
                    ? new InkWell(
                        onTap: () {
                          setState(() {
                            statusClick = true;
                          });
                          _playAnimation();
                        },
                        child: new SignIn())
                    : new StartAnimation(
                        buttonController: animationControllerButton.view,
                        user: textEditingControllerUser.text,
                        pass: textEditingControllerPass.text,
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 65.0),
      child: Container(
        alignment: FractionalOffset.center,
        width: 380.0,
        height: 70.0,
        decoration: new BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(const Radius.circular(30.0)),
        ),
        child: new Text(
          "Masuk Boy...",
          style: new TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 30.0,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
}
