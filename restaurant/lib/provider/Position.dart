import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Position with ChangeNotifier{
  TextEditingController _pos = TextEditingController();
  DocumentSnapshot _data;
  DocumentSnapshot get data => _data;
  TextEditingController get pos => _pos;

  set pos(TextEditingController value) {
    _pos = value;
    notifyListeners();
  }

  set setData( DocumentSnapshot data) {
    _data = data;
    notifyListeners();
  }

}