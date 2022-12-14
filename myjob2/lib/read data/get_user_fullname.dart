// ignore_for_file: prefer_const_constructors, unused_local_variable, camel_case_types, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

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
              '${data['fullname']}',
              style: TextStyle(fontSize: 33, color: Colors.purple),
            );
          }
          return Text('loading..');
        });
  }
}
