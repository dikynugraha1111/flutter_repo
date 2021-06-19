import 'package:flutter/material.dart';
import 'dart:async';
import 'Home.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' show json;

String userhttp;
String passhttp;

class StartAnimation extends StatefulWidget {
  StartAnimation({Key key, this.buttonController, this.user, this.pass})
      : shrinkButtonAnimation = new Tween(
          begin: 380.0,
          end: 70.0,
        ).animate(CurvedAnimation(
            parent: buttonController,
            curve: Interval(
              0.0,
              0.150,
            ))),
        zoomAnimation =
            new Tween(begin: 70.0, end: 1280.0).animate(CurvedAnimation(
                parent: buttonController,
                curve: Interval(
                  0.600,
                  0.999,
                  curve: Curves.bounceInOut,
                ))),
        super(key: key);

  final AnimationController buttonController;
  final Animation shrinkButtonAnimation;
  final Animation zoomAnimation;
  final String user;
  final String pass;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Padding(
        padding: EdgeInsets.only(bottom: 70.0),
        child: zoomAnimation.value <= 380
            ? Container(
                alignment: FractionalOffset.center,
                width: shrinkButtonAnimation.value,
                height: 70.0,
                decoration: new BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(const Radius.circular(30.0)),
                ),
                child: shrinkButtonAnimation.value > 200
                    ? new Text(
                        "Masuk Boy...",
                        style: new TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 30.0,
                          letterSpacing: 0.3,
                        ),
                      )
                    : new CircularProgressIndicator(
                        strokeWidth: 1.0,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white)),
              )
            : user == userhttp && pass == passhttp
                ? Container(
                    width: zoomAnimation.value,
                    height: zoomAnimation.value,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: zoomAnimation.value < 1000
                            ? BoxShape.circle
                            : BoxShape.rectangle))
                : Container(
                    alignment: FractionalOffset.center,
                    width: shrinkButtonAnimation.value,
                    height: 70.0,
                    decoration: new BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.all(const Radius.circular(30.0)),
                    ),
                    child: shrinkButtonAnimation.value > 200
                        ? new Text(
                            "Masuk Boy...",
                            style: new TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 30.0,
                              letterSpacing: 0.3,
                            ),
                          )
                        : new CircularProgressIndicator(
                            strokeWidth: 1.0,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white)),
                  ));
  }

  @override
  _StartAnimationState createState() => _StartAnimationState();
}

class _StartAnimationState extends State<StartAnimation> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<List> data() async {
      // TODO: implement initState
      super.initState();
      final response = await http.get(
        "https://jsonplaceholder.typicode.com/users",
      );
      var datauser = json.decode(response.body);
      print(datauser[0]["name"]);

      userhttp = datauser[0]["username"];
      passhttp = datauser[0]["website"];
    }

    data();
  }

  @override
  @override
  Widget build(BuildContext context) {
    widget.buttonController.addListener(() {
      if (widget.zoomAnimation.isCompleted) {
        if (widget.user == userhttp && widget.pass == passhttp) {
          Navigator.of(context)
              .push(new MaterialPageRoute(builder: (BuildContext context) {
            return new Home();
          }));
        }
      }
    });
    return AnimatedBuilder(
      animation: widget.buttonController,
      builder: widget._buildAnimation,
    );
  }
}
