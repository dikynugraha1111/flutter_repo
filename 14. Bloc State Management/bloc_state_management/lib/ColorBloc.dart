import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum ColorEvent { to_red, to_blue }

class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.red;

  @override
  Color get initialState => Colors.red;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    _color = (event == ColorEvent.to_red) ? Colors.red : Colors.blue;
    yield _color;
  }
}
