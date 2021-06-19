import 'package:flutter/material.dart';
import './home.dart' as hometab;
import './Tentang.dart' as tentang;
import './profile.dart' as profile;

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController controllertab;

  @override
  void initState() {
    controllertab = new TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controllertab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: <String, WidgetBuilder>{
          '/handphone': (BuildContext context) => new hometab.Handphone()
        },
        home: Scaffold(
            appBar: new AppBar(
              title: new Text("Coconut App"),
              backgroundColor: Colors.brown[700],
              // bottom: new TabBar(
              //   controller: controllertab,
              //   tabs: [
              //     new Tab(
              //       icon: new Icon(
              //         Icons.home,
              //         color: Colors.white,
              //       ),
              //     ),
              //     new Tab(
              //       icon: new Icon(Icons.web, color: Colors.white),
              //     ),
              //     new Tab(
              //       icon: new Icon(Icons.person, color: Colors.white),
              //     )
              //   ],
              // ),
            ),
            body: new TabBarView(
              controller: controllertab,
              children: [
                new hometab.Hometab(),
                new tentang.Tentang(
                  data: new List<String>.generate(300, (i) => "ini data ke $i"),
                ),
                new profile.Profile()
              ],
            ),
            bottomNavigationBar: new Material(
              color: Colors.brown[700],
              child: new TabBar(
                controller: controllertab,
                tabs: [
                  new Tab(
                    icon: new Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                  new Tab(
                    icon: new Icon(Icons.web, color: Colors.white),
                  ),
                  new Tab(
                    icon: new Icon(Icons.person, color: Colors.white),
                  )
                ],
              ),
            )));
  }
}
