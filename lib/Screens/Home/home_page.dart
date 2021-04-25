import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/Screens/Instruc_videos/instruc_video_online.dart';
import 'package:levelup/Screens/auth/sign_in.dart';
import 'package:levelup/Screens/camps/levelup_camps.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/common/common.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser.uid).get().then((value){
      coursesList = value.get("listCourses");
    });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            InkWell(
              onTap: () {
                screenPush(context, InstructionVideos());
              },
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(size.width * 0.01),
                      height: size.height * 0.3,
                      width: size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/title1.png")),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(size.width * 0.01),
                      height: size.height * 0.3,
                      width: size.width,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    Positioned(
                      top: size.height * 0.04,
                      left: size.width * 0.11,
                      child: Container(
                        width: size.width * 0.8,
                        height: size.height * 0.25,
                        alignment: Alignment.center,
                        child: Text(
                          "Instructional Videos\n& Online Programs",
                          style: GoogleFonts.pathwayGothicOne(
                              fontSize: size.width * 0.05 + 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _launchURL("https://www.leveluppickleballcamps.com/shop-all");
              },
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(size.width * 0.01),
                      height: size.height * 0.3,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/title2.png")),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(size.width * 0.01),
                      height: size.height * 0.3,
                      width: size.width,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    Positioned(
                      top: size.height * 0.04,
                      left: size.width * 0.17,
                      child: Container(
                        alignment: Alignment.center,
                        width: size.width * 0.7,
                        height: size.height * 0.25,
                        child: Text(
                          "Equipment and\nApparel",
                          style: GoogleFonts.pathwayGothicOne(
                              fontSize: size.width * 0.05 + 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                screenPush(context, CampsLevelUp());
              },
              child: Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.all(size.width * 0.01),
                      height: size.height * 0.3,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/title3.jpeg")),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(size.width * 0.01),
                      height: size.height * 0.3,
                      width: size.width,
                      color: Colors.black.withOpacity(0.1),
                    ),
                    Positioned(
                      top: size.height * 0.07,
                      left: size.width * 0.001,
                      child: Container(
                        height: size.height * 0.3,
                        width: size.width * 0.96,
                        child: Text(
                          "LevelUp 3-Day\n Camp",
                          style: GoogleFonts.pathwayGothicOne(
                              fontSize: size.width * 0.05 + 17,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.8),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
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

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

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
