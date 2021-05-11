import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:levelup/Screens/Duets/duet_viewing.dart';
import 'package:levelup/Screens/Profile/profile.dart';
import 'package:levelup/Screens/Store/store.dart';
import 'package:levelup/Screens/Viewing/viewing.dart';
import 'package:levelup/Screens/camps/levelup_camps.dart';
import 'package:levelup/Style/appColor.dart';

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
                    width: size.width * 0.11,
                    height: size.height * 0.033,
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
                    height: size.height * 0.033,
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
                    height: size.height * 0.033,
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
                    height: size.height * 0.033,
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
      ),
    );
  }


}
