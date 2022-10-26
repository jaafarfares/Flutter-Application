// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  String? username;
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "my job",
            style: TextStyle(
                fontSize: 30, fontFamily: "Billabong", color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
/*             Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Transform.rotate(
                    angle: 90 * pi / 180,
                    child: Icon(size: 30, Icons.add, color: Colors.black)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: Transform.rotate(
                    angle: -50 * pi / 180,
                    child: Icon(Icons.send_rounded, color: Colors.black)),
              ),
            ), */
          ],
        ),
        body: Container(
          child: StreamBuilder<DocumentSnapshot>(
              stream: usersCollection.doc(user?.uid).snapshots(),
              builder: (contex, streamSnapshot) {
                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                }
                return Column(
                  children: [
                    Text(streamSnapshot.data!['fullname']),
                    Text(streamSnapshot.data!['email']),
                    Text(streamSnapshot.data!['age']),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
