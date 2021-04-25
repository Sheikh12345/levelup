import 'package:better_player/better_player.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:levelup/Services/database-server/server.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/VideoPlayer/video_player.dart';
import 'package:levelup/common/common.dart';

class RegularModule extends StatefulWidget {
  final String videoAddress;
  final desc;
  final link;
  final jsonData;
  final imageAddress;
  final title;
  const RegularModule(
      {Key key,
      this.videoAddress,
      this.desc,
      this.link,
      this.jsonData,
      this.imageAddress, this.title:""})
      : super(key: key);
  @override
  _RegularModuleState createState() => _RegularModuleState();
}

class _RegularModuleState extends State<RegularModule> {
  bool _likeButton;
  List _likeVideos = [];
  var color = Colors.transparent;
  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      _likeVideos = value.get("likedVideosList");
    }).whenComplete(() {
      print(_likeVideos.length.toString());
      setState(() {
        color = _likeVideos.any((element) => element
                .toString()
                .contains("${widget.link}${widget.videoAddress}"))
            ? Colors.red
            : Colors.grey;
      });
    });
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: primaryClr,
                alignment: Alignment.center,
                height: size.height * 0.07,
                width: size.width,
                child: Stack(
                  children: [
                    Positioned(
                      child: Text(
                        "VIDEO OVERVIEW",
                        style: txtStyleCab(
                            weight: FontWeight.w600,
                            size: size.width * 0.04,
                            color: Colors.white),
                      ),
                      top: size.height * 0.04,
                      left: size.width * 0.3,
                    ),
                    Positioned(
                      top: size.height * 0.064,
                      left: size.width * 0.29,
                      child: Container(
                        height: size.height * 0.005,
                        width: size.width * 0.375,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(
                  size.height * 0.01,
                ),
                height: size.height * 0.3,
                width: size.width * 0.95,
                decoration: BoxDecoration(
                  color: Colors.green,
                  image: DecorationImage(
                      image: NetworkImage(widget.imageAddress),
                      fit: BoxFit.fill),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: size.width * 0.9,
                        height: size.height * 0.27,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border(
                                top: BorderSide(
                                  color: Colors.white,
                                  width: size.width * 0.005,
                                ),
                                bottom: BorderSide(
                                  color: Colors.white,
                                  width: size.width * 0.005,
                                ),
                                left: BorderSide(
                                  color: Colors.white,
                                  width: size.width * 0.005,
                                ),
                                right: BorderSide(
                                  color: Colors.white,
                                  width: size.width * 0.005,
                                ))),
                      ),
                      top: size.height * 0.018,
                      left: size.width * 0.026,
                    ),
                    Positioned(
                      child: Container(
                        margin: EdgeInsets.only(top: size.height * 0.1),
                        height: size.height * 0.045,
                        width: size.width * 0.28,
                        child: Image.asset("assets/images/iconwhite.png"),
                        color: Colors.black.withOpacity(0.1),
                      ),
                      top: size.height * 0.14,
                      left: size.width * 0.01,
                    ),
                    Positioned(
                      child: MaterialButton(
                        onPressed: () {
                          screenPush(
                              context,
                              VideoPlayer(
                                address: "${widget.link}${widget.videoAddress}",
                              ));
                        },
                        child: Icon(
                          Icons.play_circle_outline_rounded,
                          color: Colors.white70,
                          size: size.width * 0.25,
                        ),
                      ),
                      top: size.height * 0.09,
                      left: size.width * 0.32,
                    ),
                    Positioned(
                      child: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: color,
                          size: size.width * 0.08,
                        ),
                        onPressed: () {
                          String month =  getDate();
                          // print("");
                          setState(() {
                            if (color == Colors.grey) {
                              color = Colors.red;
                              _likeVideos.add("${widget.link}#${widget.videoAddress}# $month ${Timestamp.now().toDate().day}, ${Timestamp.now().toDate().year}");
                            } else {
                              _likeVideos.removeAt(_likeVideos.indexWhere((element) => element.toString().contains("${widget.link}${widget.videoAddress}")));
                              color = Colors.grey;
                            }

                            Future.delayed(Duration(seconds: 2),(){
                              changeDatabaseAdd();
                            });
                          });
                        },
                      ),
                      right: 5,
                      bottom: 5,
                    )
                  ],
                ),
              ),
              Container(
                width: size.width*0.8,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: size.height * 0.03),
                child: Text(
                  "${widget.title.toString().split(".").first}",
                  style: txtStylePop(
                      size: size.width * 0.04,
                      weight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
              Container(
                width: size.width*0.8,
                margin: EdgeInsets.only(top: size.height * 0.03),
                child: Text(
                  "${widget.desc}",
                  style: txtStyleCab(
                      size: size.width * 0.034,
                      weight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  changeDatabaseAdd() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"likedVideosList": _likeVideos}).whenComplete(() {
      print("${_likeVideos.length}");
    });
  }

  String getDate() {
    int currentMonth = Timestamp.now().toDate().month;
    switch (currentMonth) {
      case 1:
        return "January";
        break;
      case 2:
        return "February";
        break;
      case 3:
        return "March";
        break;
      case 4:
        return "April";
        break;
      case 5:
        return "May";
        break;
      case 6:
        return "June";
        break;
      case 7:
        return "July";
        break;
      case 8:
        return "August";
        break;
      case 9:
        return "September";
        break;
      case 10:
        return "October";
        break;
      case 11:
        return "November";
        break;
      case 12:
        return "December";
        break;
      default:
        return "";
    }
  }
}
