// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_import, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myjob2/home_page.dart';
import 'package:myjob2/read%20data/get_user_fullname.dart';
import 'package:myjob2/user_settings_page.dart';
import 'login_page.dart';
import 'auth/main_page.dart';

class userpage extends StatefulWidget {
  const userpage({super.key});

  @override
  State<userpage> createState() => _userpageState();
}

class _userpageState extends State<userpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 75,
        backgroundColor: Colors.deepPurple[200],
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.black,
                      ),
                      Padding(
                          padding: EdgeInsets.all(22),
                          child: Text('Home',
                              style: TextStyle(fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(
                        Icons.settings,
                        size: 30,
                        color: Colors.black,
                      ),
                      Padding(
                          padding: EdgeInsets.all(22),
                          child: Text('Profil Settings',
                              style: TextStyle(fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 3,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        size: 30,
                        color: Colors.black,
                      ),
                      Padding(
                          padding: EdgeInsets.all(22),
                          child: Text(
                            'Loug Out',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                ),
              ],
              child: Icon(
                Icons.menu,
                size: 40,
              ),
              onSelected: (int menu) {
                if (menu == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => homepage()),
                  );
                } else if (menu == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => usersettings()),
                  );
                } else if (menu == 3) {
                  Navigator.pop(context, true);
                  FirebaseAuth.instance.signOut();
                }
              },
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Row(
        children: [
          Flexible(
              child: Text(
                  'Hi everyone - I am looking for a new role and would appreciate your support. Thank you in advance for any connections, advice, or opportunities you can offer. #OpenToWork #opportunities #connections'))
        ],
      )),
    );
  }
}
