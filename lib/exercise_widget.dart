import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ExerciseWidget extends StatelessWidget {

  Widget _buildListItem(BuildContext context, DocumentSnapshot document) {
    print(document);
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              document['Name'],
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Color(0xffddddff),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(
              document['Repetitions'].toString(),
              style: Theme.of(context).textTheme.display1,
            ),
          ),
        ]
      ),
      onTap: () {
        print("Should do something here");
        print("Should do something here");
      }
    );
  }

    Future<FirebaseUser> getCurrentUser() async {
      FirebaseUser user = await FirebaseAuth.instance.currentUser();
      return user;
    }
  @override
  Widget build (BuildContext context) {
    var uid = getCurrentUser();
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore.instance.collection('exercises').where("exercises", arrayContains: uid).snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) return const Text('Loading ...');
          return ListView.builder(
            itemExtent: 80.0,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) =>
                _buildListItem(context, snapshot.data.documents[index]),
          );
        }
    ));
  }
}