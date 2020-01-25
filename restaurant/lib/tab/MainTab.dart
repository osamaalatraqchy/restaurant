import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../pages/DetailPage.dart';

class MainTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: Firestore.instance.collection('food').where('cat', isEqualTo: 'main').snapshots(),
        builder: (context, snapshot) {
          if(snapshot.data == null) return Center(child: CircularProgressIndicator());
          return ListView.builder(
            itemExtent: 350.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              return _buildCard(context, snapshot.data.documents[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildCard(BuildContext context, DocumentSnapshot data) => SizedBox(
      child:
            GestureDetector(
            child: Container(
              margin: EdgeInsets.all(10),
              child: Card(
                elevation: 0.5,
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                     Image(
                      image: NetworkImage(data['img']),
                      height: 200,
                      fit: BoxFit.fill,
                    ),
                    ListTile(
                      title: Text(data['name'],
                          style: TextStyle(fontWeight: FontWeight.normal)),
                      subtitle: Text('${data['price']} IQD'),
                    ),
                    RaisedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(data)));
                    },
                        child: Icon(Icons.shopping_basket, color: Colors.white,),
                        color: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.deepPurple)
                        )),

                  ],
                ),
              ),
              decoration: new BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    new BoxShadow(
                      offset: Offset(2, 0),
                      color: Colors.grey[200],
                      blurRadius: 7.0,
                    ),
                  ]),
            ),
          )

      );


}


/////////////
