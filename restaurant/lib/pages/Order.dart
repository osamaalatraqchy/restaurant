import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/provider/Position.dart';
import 'package:restaurant/tab/TabMaster.dart';


class Order extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderState();
  }
}

class OrderState extends State<Order> {

  Widget build(BuildContext context) {
    final position = Provider.of<Position>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Price is : ')),
      body: StreamBuilder(
        stream: Firestore.instance.collection('order').where('position', isEqualTo : position.pos.text).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null)
            return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemExtent: 120,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return _buildCard(context, snapshot.data.documents[index], index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async{
          Navigator.push(context, MaterialPageRoute(builder: (context) => TabMaster()));
    },
    icon: Icon(Icons.add),
    label: Text("Add"),
    ),
    );
  }

  Widget _buildCard(BuildContext context, DocumentSnapshot data, int index) => SizedBox(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Dismissible(
              key: Key(UniqueKey().toString()),
              background: Container(
                alignment: AlignmentDirectional.centerEnd,
                color: Colors.blue,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              onDismissed: (direction) {
                setState(() {
                 Firestore.instance.collection('order').document(data.documentID).delete();
                });
              },
              direction: DismissDirection.endToStart,
              child: Card(
                elevation: 5,
                child: Container(
                  height: 150.0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 150.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                topLeft: Radius.circular(5)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(data['img']))),
                      ),
                      Container(
                        height: 150,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                data['name'],
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                                child: Text('${data['price'] * data['quan']}  IQD'),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                                child: Container(
                                  width: 260,
                                  child: Text(
                                    data['quan'].toString(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 48, 48, 54)),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  data['time'].toString(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
      );
}
