import 'package:flutter/material.dart';

class Position with ChangeNotifier{
  TextEditingController _pos = TextEditingController();
  TextEditingController get pos => _pos;

  set pos(TextEditingController value) {
    _pos = value;
    notifyListeners();
  }

}