import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  AnimationController animationControllerScreen;
  Animation animationScreen;
  AnimationController animationControllerCover;
  Animation animationCover;
  AnimationController animationControllerProfile;
  Animation animationProfile;
  AnimationController animationControllerDetail;
  Animation animationDetail;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationControllerScreen = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animationScreen = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(animationControllerScreen);

    animationControllerCover = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animationCover = Tween(
      begin: 0.0,
      end: 240.0,
    ).animate(CurvedAnimation(
        parent: animationControllerCover,
        curve: Interval(0.600, 0.999, curve: Curves.bounceInOut)));

    animationControllerProfile = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    animationProfile = Tween(
      begin: 0.0,
      end: 100.0,
    ).animate(CurvedAnimation(
        parent: animationControllerProfile,
        curve: Interval(0.500, 0.999, curve: Curves.bounceInOut)));

    animationControllerDetail = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );
    animationDetail = Tween(
      begin: 0.0,
      end: 700.0,
    ).animate(CurvedAnimation(
        parent: animationControllerDetail,
        curve: Interval(0.150, 0.999, curve: Curves.bounceOut)));

    animationControllerScreen.forward();
    animationControllerCover.forward();
    animationControllerProfile.forward();
    _delay();
  }

  Future _delay() async {
    await Future.delayed(Duration(milliseconds: 350));
    animationControllerDetail.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          leading: Icon(Icons.home),
          title: new Text("Home Page"),
          backgroundColor: Colors.blue,
        ),
        body: new SingleChildScrollView(
          child: new Stack(
            children: [
              new AnimationScreen(
                animation: animationScreen,
              ),
              new AnimationCover(
                animation: animationCover,
              ),
              new AnimationProfile(
                animation: animationProfile,
              ),
              new AnimationDetail(
                animation: animationDetail,
              ),
            ],
          ),
        ));
  }
}

class AnimationScreen extends AnimatedWidget {
  AnimationScreen({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      width: 1280,
      height: 1280,
      color: Colors.blue.withOpacity(animation.value),
    );
  }
}

class AnimationCover extends AnimatedWidget {
  AnimationCover({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      height: animation.value,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("img/welcome.png"), fit: BoxFit.cover)),
    );
  }
}

class AnimationProfile extends AnimatedWidget {
  AnimationProfile({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      height: 480.0,
      child: Center(
        child: Container(
          height: animation.value,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2.5),
              image: DecorationImage(
                image: AssetImage(
                  "img/profile2.jpg",
                ),
              )),
        ),
      ),
    );
  }
}

class AnimationDetail extends AnimatedWidget {
  AnimationDetail({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: new SizedBox(
        height: animation.value,
        child: SingleChildScrollView(
          child: new Column(
            children: [
              new Padding(padding: EdgeInsets.only(top: 300)),
              new Text(
                "Diky Nugraha Difiera",
                style: new TextStyle(
                    fontSize: 24.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w600),
              ),
              new Text(
                "Yooollooo...",
                style: new TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 2.5),
              ),
              new Padding(
                padding: EdgeInsets.all(15.0),
                child: new Text(
                  "Menurut pepatah mengatakan...'Dia yang terlahir dahulu adalah yang KAWAK'. Dengan ini jelas bahwa JS dikeluarkan pada tahun 1995. Tentunya tahun yang sangat panjang telah dilaluinya, sudah sepantasnya dia digantikan. Karena ada orang mengatakan 'YANG MUDA YANG BERKARYA'. Sekian Terimakasih",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              new Divider(
                color: Colors.black54,
              ),
              new Padding(
                padding: EdgeInsets.only(top: 13.0, bottom: 13.0),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    new Column(children: [
                      new Text("99.9 K",
                          style: new TextStyle(
                              color: Colors.blue,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500)),
                      new Padding(padding: EdgeInsets.all(2.0)),
                      new Text("Dart",
                          style: new TextStyle(
                              color: Colors.black87,
                              fontSize: 13.0,
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w300)),
                    ]),
                    new Column(children: [
                      new Text("50 K",
                          style: new TextStyle(
                              color: Colors.blue,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500)),
                      new Padding(padding: EdgeInsets.all(2.0)),
                      new Text("Kotlin",
                          style: new TextStyle(
                              color: Colors.black87,
                              fontSize: 13.0,
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w300)),
                    ]),
                    new Column(children: [
                      new Text("0.9 K",
                          style: new TextStyle(
                              color: Colors.blue,
                              fontSize: 30.0,
                              fontWeight: FontWeight.w500)),
                      new Padding(padding: EdgeInsets.all(2.0)),
                      new Text("JS",
                          style: new TextStyle(
                              color: Colors.black87,
                              fontSize: 13.0,
                              letterSpacing: 3.0,
                              fontWeight: FontWeight.w300)),
                    ])
                  ],
                ),
              ),
              new Divider(
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
