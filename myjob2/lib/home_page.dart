// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myjob2/read%20data/get_user_fullname.dart';
import 'package:myjob2/user_page.dart';
import 'login_page.dart';
import 'auth/main_page.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

List<String> docid = [];

Future getdocid() async {
  await FirebaseFirestore.instance
      .collection('users')
      .get()
      .then((snapshot) => snapshot.docs.forEach((document) {
            docid.add(document.reference.id);
          }));
}

class _homepageState extends State<homepage> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                SizedBox(width: 470),
                IconButton(
                  //hoverColor: Colors.red,
                  //focusColor: Colors.blue,

                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => userpage()),
                    );
                  },
                  icon: Icon(Icons.person), iconSize: 33,
                ),
              ]),
              //SizedBox(height: 377),
              Text(
                textAlign: TextAlign.center,
                'Welcome ' + user.email!,
                style: TextStyle(fontSize: 33),
              ),

              SizedBox(height: 22),
              MaterialButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                color: Colors.deepPurple,
                child: Text('sign out'),
              ),
              Expanded(
                child: FutureBuilder(
                  future: getdocid(),
                  builder: ((context, snapshot) {
                    return ListView.builder(
                      itemCount: docid.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: getusername(documentid: docid[index]),
                        );
                      },
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
