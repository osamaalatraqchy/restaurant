import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/api/db.dart';
import 'package:restaurant/provider/Position.dart';
import 'package:restaurant/tab/TabMaster.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Order.dart';



class Start extends StatefulWidget{
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  TextEditingController pos = TextEditingController();

  Widget build(BuildContext context){
    final position = Provider.of<Position>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(controller: position.pos, textAlign: TextAlign.center,),
              SizedBox(height: 60,),

              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                    RaisedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TabMaster()));
                    },
                        child: Icon(Icons.restaurant_menu, color: Colors.white,),
                        color: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.deepPurple)
                        )),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}