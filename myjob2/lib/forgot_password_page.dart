// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myjob2/auth/auth_page.dart';
import '../login_page.dart';
import '../home_page.dart';

class forgotpasswordpage extends StatefulWidget {
  const forgotpasswordpage({super.key});

  @override
  State<forgotpasswordpage> createState() => _forgotpasswordpageState();
}

class _forgotpasswordpageState extends State<forgotpasswordpage> {
  final _email = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  Future passwordreset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _email.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              'password reset link sent \n check your Email please',
              textAlign: TextAlign.center,
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
    ;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'enter your Email and we will send a reset link',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 15),
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
                  controller: _email,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Email'),
                ),
              ),
            ),
          ),
          MaterialButton(
            onPressed: passwordreset,
            child: Text('Reset Password'),
            color: Colors.deepPurple[200],
          ),
        ],
      ),
    );
  }
}
