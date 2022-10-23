// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_interpolation_to_compose_strings, unused_import, sort_child_properties_last, prefer_const_literals_to_create_immutables
//import 'package:flutter/services.dart';
import 'package:like_button/like_button.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
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
  late String myname;

  Padding myposts() {
    return Padding(
      padding: EdgeInsets.all(22),
      child: Container(
        child: Column(
          children: [
            SizedBox(height: 15),
            Text(
              'username is open to work',
              style: TextStyle(
                fontSize: 26,
                color: Colors.purple[700],
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            //SizedBox(width: 50),
            Row(
              children: [
                SizedBox(width: 40),
                Row(
                  children: [
                    Text(
                      'Looking for a ',
                      //textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                    Text(
                      'Software Engineer ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                    Text(
                      'roles',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 34),
            Column(
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 410,
                  height: 125,
                  child: SizedBox(
                    child: Text(
                      'Hi everyone - I am looking for a new role and would appreciate your support. Thank you in advance for any connections, advice, or opportunities you can offer. #OpenToWork #opportunities #connections',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.deepPurple),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(width: 150),
                    Container(
                      height: 40,
                      child: Image.asset(
                        "icons/email.png",
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 40,
                      child: Image.asset(
                        "icons/phone-call.png",
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 40,
                      child: Image.asset(
                        "icons/github.png",
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      height: 40,
                      child: Image.asset(
                        "icons/linkedin.png",
                      ),
                    ),
                    SizedBox(width: 30),
                  ],
                ),
              ],
            ),
/*             Row(
              children: [
                SizedBox(width: 30),
                SizedBox(
                  child: Column(
                    children: [
                      Container(
                        width: 410,
                        height: 125,
                        padding:
                            EdgeInsets.only(left: 322, right: 100, bottom: 132),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey)),
                        child: Text(
                          'heyyyyyyyyyyyyyyyyyy',
                          style: TextStyle(fontSize: 55),
                          //textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ), */
          ],
        ),
        height: 200,
        width: 500,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/16449.jpg"),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(12),
            color: Colors.deepPurple[100]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        title: Text(
          'Gob Offers for ' + user.email!,
          //    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: false,
        toolbarHeight: 75,
        backgroundColor: Colors.deepPurple[400],
        actions: [
          MouseRegion(
            onHover: (s) {
              setState(() {
                'Mouse hovering on region';
              });
            },
            child: Tooltip(
              message: 'My Profil',
              child: IconButton(
                hoverColor: Colors.red,
                focusColor: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => userpage()),
                  );
                },
                icon: Icon(Icons.person),
                iconSize: 33,
              ),
            ),
          ),
          SizedBox(width: 10)
        ],
      ),
      body: SafeArea(
        child: Container(
          child: LiquidPullToRefresh(
            color: Colors.deepPurple[400],
            height: 250,
            animSpeedFactor: 2.0,
            showChildOpacityTransition: false,
            backgroundColor: Colors.deepPurple[500],
            onRefresh: () async {
              return await Future.delayed(Duration(seconds: 1));
            },
            child: ListWheelScrollView(
              clipBehavior: Clip.antiAlias,
              itemExtent: 340,
              physics: FixedExtentScrollPhysics(),
              perspective: 0.003,
              //useMagnifier: false,
              //magnification: 5,
              children: [
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),
                myposts(),

                /*               Row(children: [
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
                ),*/
                Column(
                  children: [
                    Expanded(
                      child: FutureBuilder(
                        future: getdocid(),
                        builder: ((context, snapshot) {
                          return ListView.builder(
                            itemCount: 1,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

/*   _fetch() async {
    final firebaseuser = await FirebaseAuth.instance.currentUser!;
    if (firebaseuser != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .document(firebaseuser.uid)
          .get()
          .then((ds) {
        myname = ds.data['fullname'];
        print(myname);
      }).catchError((e) {
        print(e);
      });
    }
  } */
}
