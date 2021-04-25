import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/VideoPlayer/video_player.dart';
import 'package:levelup/common/common.dart';

class Viewing extends StatefulWidget {
  @override
  _ViewingState createState() => _ViewingState();
}

class _ViewingState extends State<Viewing> {
  List _likeVideos = [];

  @override
  void initState() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .get()
        .then((value) {
      _likeVideos = value.get("likedVideosList");
    }).whenComplete(() {
      // print(_likeVideos.length);
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Videos",
          style: txtStylePop(
            color: Colors.white,
            weight: FontWeight.w500,
          ),
        ),
        backgroundColor: primaryClr,
        centerTitle: true,
      ),
      body: Container(
          width: size.width,
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(FirebaseAuth.instance.currentUser.uid)
                .snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data["likedVideosList"].length,
                    itemBuilder: (_, index) {
                      if (index >= 0) {
                        return Container(
                          margin: EdgeInsets.only(top: size.height * 0.01),
                          height: size.height * 0.3,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: size.width * 0.05,
                                  right: size.width * 0.05,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${snapshot.data["likedVideosList"][index].toString().split("#").last}",
                                      style: txtStylePop(
                                          weight: FontWeight.w500,
                                          size: size.width * 0.022,
                                          color: Colors.grey[800],
                                          letterSpacing: 0.7),
                                    ),
                                    Text(
                                      "Overhead Drills",
                                      style: txtStylePop(
                                          weight: FontWeight.w700,
                                          size: size.width * 0.022,
                                          color: Colors.green[600],
                                          letterSpacing: 0.7),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: size.width * 0.07,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        screenPush(
                                            context,
                                            VideoPlayer(
                                              address: snapshot
                                                      .data["likedVideosList"]
                                                          [index]
                                                      .toString()
                                                      .split("#")
                                                      .first +
                                                  snapshot
                                                      .data["likedVideosList"]
                                                          [index]
                                                      .toString()
                                                      .split("#")[1],
                                            ));
                                      },
                                      child: Container(
                                          margin: EdgeInsets.all(
                                            size.height * 0.01,
                                          ),
                                          height: size.height * 0.25,
                                          width: size.width * 0.79,
                                          decoration: BoxDecoration(
                                            color: Colors.green,
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot
                                                        .data["likedVideosList"]
                                                            [index]
                                                        .toString()
                                                        .split("#")
                                                        .first +
                                                    "thumbnail.jpg"),
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
                                                    )),
                                                top: size.height * 0.018,
                                                left: size.width * 0.026,
                                              ),
                                            ],
                                          )),
                                    ),
                                    Container(
                                        height: size.height * 0.05,
                                        width: size.width * 0.1,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: size.width * 0.07,
                                          ),
                                          onPressed: () {
                                            _likeVideos.removeAt(index);
                                            print("${_likeVideos.length}");
                                            Future.delayed(Duration(seconds: 1),
                                                () {
                                              changeDatabaseAdd();
                                            });
                                          },
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      } else {
                        return Center(
                          child: Text("Empty list"),
                        );
                      }
                    });
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("Network Error"),
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: Text("Empty list"),
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          )),
    ));
  }

  changeDatabaseAdd() {
    FirebaseFirestore.instance
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser.uid)
        .update({"likedVideosList": _likeVideos}).whenComplete(() {
      print("${_likeVideos.length}");
    });
  }
}
