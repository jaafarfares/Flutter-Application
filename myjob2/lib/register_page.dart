// ignore_for_file: prefer_const_constructors, camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';

import '../login_page.dart';
import '../home_page.dart';

class registerpage extends StatefulWidget {
  final VoidCallback showloginpage;
  const registerpage({super.key, required this.showloginpage});

  @override
  State<registerpage> createState() => _registerpageState();
}

class _registerpageState extends State<registerpage> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmpassword = TextEditingController();
  final _fullname = TextEditingController();
  final _profession = TextEditingController();
  final _age = TextEditingController();
  final _phonenumber = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmpassword.dispose();
    _fullname.dispose();
    _profession.dispose();
    _age.dispose();
    _phonenumber.dispose();
    super.dispose();
  }

  Future signup() async {
    if (passwordconfirm()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );
      adduserdetails(
        _fullname.text.trim(),
        _email.text.trim(),
        _profession.text.trim(),
        int.parse(_age.text.trim()),
        int.parse(_phonenumber.text.trim()),
      );
    }
  }

  bool passwordconfirm() {
    if (_password.text.trim() == _confirmpassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future adduserdetails(
    String fullname,
    String email,
    String profession,
    int age,
    int phonenumber,
  ) async {
    await FirebaseFirestore.instance.collection('users').add({
      'fullname': fullname,
      'email': email,
      'profession': profession,
      'age': age,
      'phone number': phonenumber,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 22),
                SizedBox(height: 33),
                Text(
                  'hello there',
                  style: GoogleFonts.bebasNeue(fontSize: 44),
                ),
                SizedBox(height: 33),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _fullname,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Full Name'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _profession,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Profesion'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _age,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Age'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _phonenumber,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Phone Number'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _email,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'email'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _password,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none, hintText: 'Password'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: TextField(
                        controller: _confirmpassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Confirm Password'),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: GestureDetector(
                    onTap: signup,
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I\'m A Member?  ',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                    ),
                    GestureDetector(
                      onTap: widget.showloginpage,
                      child: Text(
                        'Login Now',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
