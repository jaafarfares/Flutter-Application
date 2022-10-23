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
      backgroundColor: Colors.white,

      //backgroundColor: Colors.deepPurple[100],
/*       appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 75,
        backgroundColor: Colors.deepPurple[200],
        actions: [

        ],
      ), */
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Container(
                  child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 470, top: 8),
                    child: PopupMenuButton(
                      position: PopupMenuPosition.under,
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)))
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
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)))
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ))
                            ],
                          ),
                        ),
                      ],
                      child: Icon(
                        Icons.menu,
                        size: 45,
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
                            MaterialPageRoute(
                                builder: (context) => usersettings()),
                          );
                        } else if (menu == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => mainpage()),
                          );
                          FirebaseAuth.instance.signOut();
                        }
                      },
                    ),
                  )
                ],
              )),
              SizedBox(height: 70),
              Container(
                height: 170,
                child: Column(
                  children: [
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 50),
                        Stack(
                          children: <Widget>[
                            CircleAvatar(
                              maxRadius: 75,
                              backgroundImage: AssetImage('images/myimg.png'),
                            ),
                            Positioned(
                                right: 18, child: Icon(Icons.verified_user))
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              'Jaafar Fares',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36,
                                  fontFamily: 'ComingSoon'),
                            ),
                            Text(
                              'Software Engineer',
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 27,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 45),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 100),
                  Container(
                    height: 70,
                    child: Image.asset(
                      "icons/email.png",
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    height: 70,
                    child: Image.asset(
                      "icons/phone-call.png",
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    height: 70,
                    child: Image.asset(
                      "icons/github.png",
                    ),
                  ),
                  SizedBox(width: 30),
                  Container(
                    height: 70,
                    child: Image.asset(
                      "icons/linkedin.png",
                    ),
                  ),
                  SizedBox(width: 50),
                ],
              ),
              SizedBox(height: 70),
              Column(
                children: [
                  Container(
                    width: 440,
                    height: 55,
                    child: SizedBox(
                      child: Text(
                        'About',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 33,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    width: 440,
                    height: 125,
                    child: SizedBox(
                      child: Text(
                        'Hi everyone - I am looking for a new role and would appreciate your support. Thank you in advance for any connections, advice, or opportunities you can offer. #OpenToWork #opportunities #connections.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
