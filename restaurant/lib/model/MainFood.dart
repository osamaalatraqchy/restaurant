
import 'package:cloud_firestore/cloud_firestore.dart';
class MainFood{
  final String name;
  final String describe;
  final String img;
  final double price;
  final String time;

  MainFood({this.name, this.describe, this.img, this.price, this.time});

  factory MainFood.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;
    return MainFood(
      name: data['name'] ?? '',
      describe: data['describe'] ?? '',
      img: data['img'] ?? '',
      price: data['price'] ?? '',
      time: data['time'] ?? '',
    );
  }


}