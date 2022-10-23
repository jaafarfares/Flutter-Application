// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_import, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myjob2/home_page.dart';
import 'package:myjob2/read%20data/get_user_fullname.dart';
import 'package:myjob2/user_page.dart';
import 'login_page.dart';
import 'auth/main_page.dart';
import 'package:flutter/src/material/checkbox.dart';
import 'package:provider/provider.dart';

class usersettings extends StatefulWidget {
  const usersettings({super.key});

  @override
  State<usersettings> createState() => _usersettingsState();
}

class _usersettingsState extends State<usersettings> {
  //final _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  final _auth = FirebaseAuth.instance;
  late String? _username;
  late String? _profession;
  late String? _email;
  late int? _age;
  late int? _number;
  late String? _github;
  late String? _linkden;
  late String? _description;

/*   @override
  void initState() {
    super.initState();

    getcurrentuser();
  }

  void getcurrentuser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        signedInUser = user;
        signedInUser.email;
      }
    } catch (e) {
      print(e);
    }
  } */

  @override
  void dispose() {
    super.dispose();
  }

  signOut() async {
    Navigator.pop(context, true);

    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 90,
          centerTitle: true,
          backgroundColor: Colors.deepPurple[200],
          title: Text(
            'Edit your profile her',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
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
                          Icons.person,
                          size: 30,
                          color: Colors.black,
                        ),
                        Padding(
                            padding: EdgeInsets.all(22),
                            child: Text('User Profil',
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
                      MaterialPageRoute(builder: (context) => userpage()),
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
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 10,
                                  color: Color.fromARGB(255, 130, 100, 180),
                                  spreadRadius: 2)
                            ],
                          ),
                          child: CircleAvatar(
                            radius: 95,
                            backgroundColor: Colors.yellow,
                            backgroundImage: AssetImage("images/home_img.png"),
                          ),
                        ),
                        Positioned(
                          bottom: 5.0,
                          right: 5.0,
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  SizedBox(height: 10),
                  TextFormField(
                    onChanged: (value) {
                      _username = value;
                    },
                    style: TextStyle(fontSize: 20),
                    /*                   validator: (value) {
                        if (value == null || value.length < 3) {
                          return 'Please enter some text';
                        }
                        return null;
                      }, */
                    maxLength: 15,
                    decoration: InputDecoration(
                      counterText: '',
                      //errorText: '',
                      //hintText: 'Jaafar',
                      labelText: 'username',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(color: Colors.purple, width: 2)),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                      onChanged: (value) {
                        _profession = value.toString();
                      },
                      style: TextStyle(fontSize: 20),
                      maxLength: 22,
                      decoration: InputDecoration(
                          // floatingLabelBehavior: FloatingLabelBehavior.always,
                          counterText: '',
                          //hintText: 'Software Eengineer',
                          labelText: 'Profession',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)))),
                  SizedBox(height: 10),
                  TextFormField(
                      onChanged: (value) {
                        _email = value.toString();
                      },
                      style: TextStyle(fontSize: 20),
                      maxLength: 25,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          counterText: '',
                          //hintText: 'flenbenfoulen@gmail.com',
                          labelText: 'Email',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)))),
                  SizedBox(height: 10),
                  TextFormField(
                      onChanged: (value) {
                        _age = int.parse(value);
                      },
                      style: TextStyle(fontSize: 20),
                      maxLength: 25,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          counterText: '',
                          //hintText: 'type in your age',
                          labelText: 'age',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)))),
                  SizedBox(height: 10),
                  TextFormField(
                      onChanged: (value) {
                        _number = int.parse(value);
                      },
                      style: TextStyle(fontSize: 20),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      maxLength: 8,
                      decoration: InputDecoration(
                          counterText: '',
                          // hintText: '123456789',
                          labelText: 'phone number',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)))),
                  SizedBox(height: 10),
                  TextFormField(
                      onChanged: (value) {
                        _github = value.toString();
                      },
                      style: TextStyle(fontSize: 20),
                      maxLength: 15,
                      decoration: InputDecoration(
                          counterText: '',
                          // hintText: 'jaafarfares',
                          labelText: 'github',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)))),
                  SizedBox(height: 10),
                  TextFormField(
                      onChanged: (value) {
                        _linkden = value.toString();
                      },
                      style: TextStyle(fontSize: 20),
                      maxLength: 15,
                      decoration: InputDecoration(
                          counterText: '',
                          // hintText: 'fares jaafar',
                          labelText: 'Linkden',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)))),
                  SizedBox(height: 10),
                  TextFormField(
                      onChanged: (value) {
                        _description = value.toString();
                      },
                      style: TextStyle(fontSize: 20),
                      maxLength: 300,
                      maxLines: 4,
                      decoration: InputDecoration(
                          counterText: '',
                          alignLabelWithHint: true,
                          //hintText: 'tell me more details about yourself.',
                          labelText: 'Description',
                          border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              borderSide:
                                  BorderSide(color: Colors.purple, width: 2)))),
                  Padding(
                    padding: const EdgeInsets.all(11),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          //shape: const CircleBorder(),
                          backgroundColor: Colors.deepPurple[200],
                        ),
                        onPressed: () {
                          FirebaseFirestore.instance.collection('users').add({
                            'fullname': _username,
                            'phone number': _number,
                            'linkden': _linkden,
                            'description': _description,
                            'githuub': _github,
                            'email': _email,
                            'age': _age,
                            'profession': _profession,
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => userpage()),
                          );
                        },
                        child: const Text(
                          'Save',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        )),
                  ),
                  SizedBox(height: 70),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
