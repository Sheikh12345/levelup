import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:levelup/Screens/Duets/duet_viewing.dart';
import 'package:levelup/Screens/Home/component/dialog.dart';
import 'package:levelup/Screens/Profile/profile.dart';
import 'package:levelup/Screens/Store/store.dart';
import 'package:levelup/Screens/Viewing/viewing.dart';
import 'package:levelup/Screens/auth/sign_in.dart';
import 'package:levelup/Screens/camps/levelup_camps.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/common/common.dart';
import 'package:toast/toast.dart';

import 'home_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex;

  List pages = [
    HomePage(),
    DuetView(),
    Viewing(),
    Store(),
    CampsLevelUp(),
    Setting()
  ];

  void _incrementTab(index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF75ad49),
      statusBarBrightness: Brightness.dark,
    ));
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: pages.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          height: size.height * 0.067 + 5,
          color: primaryClr,
          child: BottomNavigationBar(
            backgroundColor: primaryClr,
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.shifting,
            items: [
              BottomNavigationBarItem(
                backgroundColor: primaryClr,
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: size.height * 0.029,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(
                      color: Colors.black, fontSize: size.width * 0.03),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: primaryClr,
                icon: Container(
                    width: size.width * 0.12,
                    height: size.height * 0.034,
                    child: Image.asset(
                      "assets/menuimg/duets.png",
                    )),
                title: Text(
                  "Duets",
                  style: TextStyle(
                      color: Colors.black, fontSize: size.width * 0.03),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: primaryClr,
                icon: Container(
                    width: size.width * 0.07,
                    height: size.height * 0.034,
                    child: Image.asset(
                      "assets/menuimg/video.png",
                    )),
                title: Text(
                  "Video",
                  style: TextStyle(
                      color: Colors.black, fontSize: size.width * 0.03),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: primaryClr,
                icon: Container(
                    width: size.width * 0.07,
                    height: size.height * 0.034,
                    child: Image.asset(
                      "assets/menuimg/paddle.png",
                    )),
                title: Text(
                  "Products",
                  style: TextStyle(
                      color: Colors.black, fontSize: size.width * 0.03),
                ),
              ),
              BottomNavigationBarItem(
                backgroundColor: primaryClr,
                icon: Container(
                    width: size.width * 0.05,
                    height: size.height * 0.034,
                    child: Image.asset(
                      "assets/menuimg/up.png",
                    )),
                title: Text(
                  "Camps",
                  style: TextStyle(
                      color: Colors.black, fontSize: size.width * 0.03),
                ),
              ),
            ],
            onTap: (index) {
              _incrementTab(index);
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryClr,
          child: Icon(Icons.logout),
          onPressed: () async{
            _showDialog(size,context);
          },
        ),
      ),
    );
  }

  _showDialog(Size size, BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
        title: Text("Are you sure to logout?"),
        actions: [
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut().whenComplete(() {
                Toast.show("Successfully logout", context,
                    gravity: 1,
                    duration: 1,
                    textColor: Colors.black,
                    backgroundColor: primaryClr);
              });
              Navigator.pop(context);
              screenPushRep(context, SignIn());
            },
            child: Text("Yes"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No"),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  DialogContent(Size size) {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: [
        Container(
          alignment: Alignment.center,
          height: size.width * 0.7,
          width: size.width,
        ),
        Positioned(
          bottom: 190,
          left: 50,
          right: 50,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: Colors.transparent,
            child: Image.asset(
              "assets/images/icon.png",
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 80),
          height: size.width * 0.6,
          child: Column(
            children: [
              Text(
                "Thanks for choosing us",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              Text(
                "We will contact you soon!",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    height: 2,
                    color: Colors.black),
              ),
              Spacer(),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  "Ok",
                  style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF005C97),
                      fontWeight: FontWeight.w900),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
