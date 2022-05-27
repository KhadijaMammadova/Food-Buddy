import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_buddy/components/constants.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('chats').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...', style: TextStyle(color: Colors.white),);
        }
        return ListView(
          children: snapshot.data!.docs
              .map((doc) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: 
                  NetworkImage("https://placekitten.com/200/200"),
                ),
                    title: Text(doc['name']),
                    subtitle: Text(doc['message']),
                    trailing: Column(
                      children: <Widget>[Text('19:30'),
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Center(
                          child: Text(
                            "100", 
                            textScaleFactor: 0.6,
                            style: TextStyle(
                            fontWeight: FontWeight.bold, 
                          color: Colors.white),
                          ),
                        ),
                        )
                    ]),
                  ))
              .toList(),
        );
      },
    );
  }
}
