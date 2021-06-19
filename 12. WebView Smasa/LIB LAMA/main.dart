import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webviewsmasa/ardila.dart';
import 'package:webviewsmasa/login.dart';
import 'package:webviewsmasa/websmasa.dart';
import 'package:webviewsmasa/youtube.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
          splash: Image.asset(
            'img/ARDIAL.png',
            width: 225.0,
          ),
          splashIconSize: 225.0,
          splashTransition: SplashTransition.fadeTransition,
          backgroundColor: Colors.blue[900],
          duration: 3000,
          nextScreen: HomeTab()),
    );
  }
}

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  var radius = Radius.circular(10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(30), topLeft: Radius.circular(30)),
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 2, blurRadius: 3),
          ],
        ),
        child: new TabBar(
            controller: tabController,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.blue[800],
            labelStyle:
                new TextStyle(fontSize: 12.0, fontWeight: FontWeight.w600),
            tabs: [
              Tab(
                icon: Icon(FontAwesomeIcons.home),
                text: 'Ardial',
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.youtube),
                text: 'Youtube',
              ),
              Tab(
                icon: Icon(Icons.web_sharp),
                text: 'WebSmasa',
              ),
              Tab(
                icon: Icon(Icons.login),
                text: 'Login',
              ),
            ]),
      ),
      body: new TabBarView(controller: tabController, children: [
        ArdilaPage(),
        YoutubePage(),
        WebSmasaPage(),
        LoginPage(),
      ]),
    );
  }
}
