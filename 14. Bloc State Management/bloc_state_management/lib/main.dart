import 'package:bloc_state_management/ColorBloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider<ColorBloc>(
          builder: (context) => ColorBloc(), child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Bloc State Management"),
      ),
      floatingActionButton: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.to_red);
            },
            backgroundColor: Colors.red,
          ),
          Padding(padding: EdgeInsets.only(right: 5.0)),
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.to_blue);
            },
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      body: new Center(
          child: BlocBuilder<ColorBloc, Color>(
        builder: (context, colorSaatIni) => new AnimatedContainer(
            height: 100,
            width: 100,
            color: colorSaatIni,
            duration: Duration(milliseconds: 500)),
      )),
    );
  }
}
