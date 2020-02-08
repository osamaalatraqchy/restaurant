import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/provider/Position.dart';
import 'package:restaurant/tab/TabMaster.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatefulWidget {
  final DocumentSnapshot data;
  DetailPage(this.data);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var count = 0;
  final api = Firestore.instance;
  Widget build(context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss').format(now);
    final position = Provider.of<Position>(context);
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.deepPurple,
          onPressed: () async{
            api.collection('order').add({
              'position' : position.pos.text,
              'name' : widget.data['name'],
              'img' : widget.data['img'],
              'price' : int.parse(widget.data['price']),
              'quan' : count,
              'time' : formattedDate.toString()
            });
            Navigator.push(context, MaterialPageRoute(builder: (context) => TabMaster()));
          },
          child: Icon(Icons.add_shopping_cart, color: Colors.white,),
        ),
        appBar: AppBar( title: Text(widget.data['name']),),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Card(
                  color: Colors.black,
                  shape: BeveledRectangleBorder(),
                  child: CircleAvatar(
                    radius: 200,
                    backgroundImage: NetworkImage(widget.data['img']),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Flexible(
                  child: GestureDetector(
                    onTap: (){
                      _neverSatisfied();
                    },
                    child: Card(
                      color: Colors.blueAccent,
                      shape: StadiumBorder(),
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: Text(widget.data['desc'], style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FloatingActionButton(onPressed: () {setState(() {
                      count++;
                    });}, child: Text("+"), heroTag: "plus", backgroundColor: Colors.blue,),
                    SizedBox(width: 10,),
                    Text('$count'),
                    SizedBox(width: 10,),
                    FloatingActionButton(onPressed: () {setState(() {
                      count >0 ? count-- : count;
                    });}, child: Text('-'), heroTag: "min", backgroundColor: Colors.blue,),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(widget.data['name']),
                SizedBox(
                  height: 5,
                ),
                Text('${int.parse(widget.data['price']) * count} IQD'),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }

  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(widget.data['name']),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(widget.data['desc']),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
