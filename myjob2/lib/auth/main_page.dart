import 'package:flutter/material.dart';
import 'package:myjob2/auth/auth_page.dart';
import '../login_page.dart';
import '../home_page.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return homepage();
            } else {
              return authpage();
            }
          }),
    );
  }
}
