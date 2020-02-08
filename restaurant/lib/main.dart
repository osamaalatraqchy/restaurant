import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/pages/Start.dart';
import 'package:restaurant/provider/Position.dart';

void main() => runApp(MyApp());
    class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return
           MultiProvider(
             providers: [
               ChangeNotifierProvider<Position>.value(value: Position()),
             ],
             child: MaterialApp(
              home: WillPopScope(
                onWillPop: () async => false,
                child: Scaffold(
                  appBar: AppBar(title: Text('Restaurant'),),
                  body: Start(),

                ),
              )
        ),
           );

  }

    }