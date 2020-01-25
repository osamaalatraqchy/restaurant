/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/provider/Position.dart';

class Quantity extends StatefulWidget{
  @override
  _QuantityState createState() => _QuantityState();
}

class _QuantityState extends State<Quantity> {
  @override
  Widget build(BuildContext context) {
    final count = Provider.of<Position>(context);
    return Center(
      child: Row(
        children: <Widget>[
          FloatingActionButton(onPressed: () {count.increment();}, child: Text("+"), heroTag: "plus",),
          Text('${count.main_quan}'),
          FloatingActionButton(onPressed: () {setState(() {
            count.main_quan >0 ? count.decrement() : count.main_quan;
          });}, child: Text('-'), heroTag: "min",),
        ],
      ),
    );
  }
}
*/
