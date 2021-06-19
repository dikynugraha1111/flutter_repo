import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MainProvideController with ChangeNotifier {
  bool _isBlue = true;

  bool get isBlue => _isBlue;
  set isBlue(bool value) {
    _isBlue = value;
    notifyListeners();
  }

  Color get color => (_isBlue) ? Colors.lightBlue : Colors.black;
}
