import 'package:flutter/material.dart';
import 'package:myjob2/register_page.dart';
import '../login_page.dart';
import '../home_page.dart';

class authpage extends StatefulWidget {
  const authpage({super.key});

  @override
  State<authpage> createState() => _authpageState();
}

class _authpageState extends State<authpage> {
  bool showloginpage = true;

  void togglecrens() {
    setState(() {
      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showloginpage) {
      return loginpage(showregisterpage: togglecrens);
    } else {
      return registerpage(showloginpage: togglecrens);
    }
  }
}
