// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';

class getusername extends StatelessWidget {
  final String documentid;
  getusername({required this.documentid});
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(documentid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Text(
              '${data['age']}',
              style: TextStyle(fontSize: 33, color: Colors.purple),
            );
          }
          return Text('loading..');
        });
  }
}
