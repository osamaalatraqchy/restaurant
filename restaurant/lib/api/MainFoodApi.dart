import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:restaurant/model/MainFood.dart';

class ApiProvider {
  final Firestore _db = Firestore.instance;

   streamMain(){
 var _ref = _db.collection("main");
  _ref.snapshots().map((list)=>  list.documents.map((doc) => MainFood.fromFireStore(doc)).toList());

  }
}