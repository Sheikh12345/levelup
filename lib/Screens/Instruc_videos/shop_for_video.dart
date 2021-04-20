import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levelup/Services/database-server/server.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/common/common.dart';

import 'components/first-slide_tile.dart';
import 'course_details.dart';

class ShopForVideo extends StatefulWidget {
  @override
  _ShopForVideoState createState() => _ShopForVideoState();
}

class _ShopForVideoState extends State<ShopForVideo> {
  String desc1 =
      "This program is designed for players new to pickleball wanting to learn the rules, basic  strokes and strategies";
  String desc2 =
      "This program is designed for students who want to do practice also";

  String _serverUrl = "https://pickleball-levelup.herokuapp.com/read/allskills";
  @override
  void initState() {
    super.initState();
   FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser.uid).get().then((value){
     coursesList = value.get("listCourses");
     print(coursesList.length);
   });
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.003),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              /// title first Section
              Container(
                width: size.width,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    left: size.width * 0.04, top: size.height * 0.06),
                child: Text(
                  "Complete Level Based Programs",
                  style: txtStyleCab(
                      size: size.width * 0.04,
                      weight: FontWeight.w900,
                      color: Colors.grey[600]),
                ),
              ),

              ///first Slide Section
              Container(
                margin: EdgeInsets.only(
                  top: size.height * 0.01,
                ),
                height: size.height * 0.27,
                width: size.width,
                child:FutureBuilder(
                  future: Server().getDataFromServer1(url: _serverUrl),
                  builder: (_,snapshot){
                    String imageAddress = "https://pickleball-levelup.herokuapp.com/read/skill";
                    if(snapshot.hasData){
                      return ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CLBPSlide(
                            image: "${imageAddress}1/thumbnail.jpg",
                            desc: snapshot.data.skill1.description,
                            title: snapshot.data.skill1.title,
                            json: snapshot.data.skill1,
                            onTap: () {
                              screenPush(
                                  context,
                                  CourseDetails(
                                    json: snapshot.data.skill1,
                                    trailer:
                                    "https://pickleball-levelup.herokuapp.com/read/skill1/${snapshot.data..skill1.trailer[0]}",
                                    thumbnail: "${imageAddress}1/thumbnail.jpg",
                                    route: "/read/skill1",
                                  ));
                            },
                          ),
                          CLBPSlide(
                            image: "${imageAddress}2/thumbnail.jpg",
                            desc: snapshot.data.skill2.description,
                            title: snapshot.data.skill2.title,
                            json: snapshot.data.skill2,
                            onTap: () {
                              screenPush(
                                  context,
                                  CourseDetails(
                                    json: snapshot.data.skill2,
                                    trailer:
                                    "https://pickleball-levelup.herokuapp.com/read/skill2/${snapshot.data..skill1.trailer[0]}",
                                    thumbnail: "${imageAddress}2/thumbnail.jpg",
                                    route: "/read/skill2",
                                  ));
                            },
                          ),
                          CLBPSlide(
                            image: "${imageAddress}3/thumbnail.jpg",
                            desc: snapshot.data.skill3.description,
                            title: snapshot.data.skill3.title,
                            json: snapshot.data.skill3,
                            onTap: () {
                              screenPush(
                                  context,
                                  CourseDetails(
                                    json: snapshot.data.skill3,
                                    trailer:
                                    "https://pickleball-levelup.herokuapp.com/read/skill3/${snapshot.data..skill1.trailer[0]}",
                                    thumbnail: "${imageAddress}3/thumbnail.jpg",
                                    route: "/read/skill3",
                                  ));
                            },
                          ),
                          CLBPSlide(
                            image: "${imageAddress}4/thumbnail.jpg",
                            desc: snapshot.data.skill4.description,
                            title: snapshot.data.skill4.title,
                            json: snapshot.data.skill4,
                            onTap: () {
                              screenPush(
                                  context,
                                  CourseDetails(
                                    json: snapshot.data.skill4,
                                    trailer:
                                    "https://pickleball-levelup.herokuapp.com/read/skill4/${snapshot.data..skill1.trailer[0]}",
                                    thumbnail: "${imageAddress}4/thumbnail.jpg",
                                    route: "/read/skill4",
                                  ));
                            },
                          ),
                          CLBPSlide(
                            image: "${imageAddress}5/thumbnail.jpg",
                            desc: snapshot.data.skill5.description,
                            title: snapshot.data.skill5.title,
                            json: snapshot.data.skill5,
                            onTap: () {
                              screenPush(
                                  context,
                                  CourseDetails(
                                    json: snapshot.data.skill5,
                                    trailer:
                                    "https://pickleball-levelup.herokuapp.com/read/skill5/${snapshot.data..skill1.trailer[0]}",
                                    thumbnail: "${imageAddress}5/thumbnail.jpg",
                                    route: "/read/skill5",
                                  ));
                            },
                          )
                        ],
                      );
                    }else if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(child: CircularProgressIndicator(),);
                    }else{
                      return Center(child: Text("Error"),);
                    }
                  },
                )
              ),

              /// title second Section
              Container(
                width: size.width,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    left: size.width * 0.04, top: size.height * 0.03),
                child: Text(
                  "INDIVIDUAL LESSONS & VIDEO DUETS",
                  style: txtStyleCab(
                      size: size.width * 0.04,
                      weight: FontWeight.w900,
                      color: Colors.grey[600]),
                ),
              ),

              ///Second Slide Section
              Container(
                margin: EdgeInsets.only(
                  top: size.height * 0.01,
                ),
                height: size.height * 0.26,
                width: size.width,
                child: FutureBuilder(
                  future: Server().getIldDataFromServer(),
                  builder: (_,snapshot){
                    if(snapshot.hasData){
                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.data.length,
                          itemBuilder: (_, index) {
                            print("data => "+snapshot.data.data.length.toString());
                            return FutureBuilder(
                                future: Server().getIldLessonFromServer(snapshot.data.data[index]),
                                builder: (_,snapshot){
                              if(snapshot.hasData){
                                return Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.only(
                                          left: size.width * 0.04,
                                        ),
                                        height: size.height * 0.2,
                                        width: size.width * 0.65,
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          image: DecorationImage(
                                              image:
                                              AssetImage("assets/images/skill2.png"),
                                              fit: BoxFit.fill),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                width: size.width * 0.59,
                                                height: size.height * 0.165,
                                                decoration: BoxDecoration(
                                                    color: Colors.black.withOpacity(0.1),
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
                                              child: Text(
                                                "{videoDuets.elementAt(index)}",
                                                style: txtStyleCab(
                                                    color: Colors.white,
                                                    size: size.width * 0.045,
                                                    weight: FontWeight.w900),
                                              ),
                                              top: size.height * 0.05,
                                              left: size.width * 0.3,
                                            ),
                                            Positioned(
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    top: size.height * 0.1),
                                                height: size.height * 0.03,
                                                width: size.width * 0.2,
                                                color: Colors.black.withOpacity(0.1),
                                                child: Image.asset(
                                                    "assets/images/iconwhite.png"),
                                              ),
                                              top: size.height * 0.058,
                                              left: size.width * 0.012,
                                            )
                                          ],
                                        )),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: size.width * 0.04,
                                      ),
                                      padding: EdgeInsets.only(
                                          left: size.width * 0.01,
                                          top: size.height * 0.005),
                                      child: Text(
                                        "$desc2",
                                        style: TextStyle(
                                            fontSize: size.width * 0.025,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 0.4,
                                            color: Colors.grey[900]),
                                      ),
                                      width: size.width * 0.68,
                                      height: size.height * 0.06,
                                    ),
                                  ],
                                );
                              }else if(snapshot.hasError){
                                return Container(height: size.height * 0.2,
                                  width: size.width * 0.65,
                                color: Colors.blue,
                                child: Text(snapshot.error.toString()),);
                              }else{
                                return Container(  height: size.height * 0.2,
                                  width: size.width * 0.65,
                                  color: Colors.pink,
                                  child: CircularProgressIndicator(),);
                              }
                            });
                          });
                    }else if(snapshot.hasError){
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    }else{
                      return Center(
                        child:CircularProgressIndicator()
                      );
                    }
                  },
                ),
              ),

              /// title third Section
              Container(
                width: size.width,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    left: size.width * 0.04, top: size.height * 0.03),
                child: Text(
                  "DRILLS, GAMES & FITNESS",
                  style: txtStyleCab(
                      size: size.width * 0.04,
                      weight: FontWeight.w900,
                      color: Colors.grey[600]),
                ),
              ),

              ///Third Slide Section
              Container(
                margin: EdgeInsets.only(
                  top: size.height * 0.01,
                ),
                height: size.height * 0.26,
                width: size.width,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 1,
                    itemBuilder: (_, index) {
                      return Column(
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                left: size.width * 0.04,
                              ),
                              height: size.height * 0.2,
                              width: size.width * 0.65,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/skills3.png"),
                                    fit: BoxFit.fill),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Container(
                                      width: size.width * 0.59,
                                      height: size.height * 0.165,
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.1),
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
                                    child: Text(
                                      "{drillsGames.elementAt(index)}",
                                      style: txtStyleCab(
                                          color: Colors.white,
                                          size: size.width * 0.045,
                                          weight: FontWeight.w900),
                                    ),
                                    top: size.height * 0.05,
                                    left: size.width * 0.3,
                                  ),
                                  Positioned(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.1),
                                      height: size.height * 0.03,
                                      width: size.width * 0.2,
                                      child: Image.asset(
                                          "assets/images/iconwhite.png"),
                                      color: Colors.black.withOpacity(0.1),
                                    ),
                                    top: size.height * 0.058,
                                    left: size.width * 0.012,
                                  )
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(
                              left: size.width * 0.04,
                            ),
                            padding: EdgeInsets.only(
                                left: size.width * 0.01,
                                top: size.height * 0.005),
                            child: Text(
                              "$desc2",
                              style: TextStyle(
                                  fontSize: size.width * 0.025,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.4,
                                  color: Colors.grey[900]),
                            ),
                            width: size.width * 0.68,
                            height: size.height * 0.06,
                          ),
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    ));
  }

  printData({List<String> data, String url}) {
    try {
      String fileName =
          data.singleWhere((element) => element.contains("thumbnail"));
      return "$url/$fileName";
    } catch (e) {
      print("error => " + e.toString());
    }
  }

  // getListItems(Size size){
  //   try{
  //     return [
  //       ///Skill 1
  //       FutureBuilder(
  //         future: Server().getDataFromServer(
  //             url:
  //             "https://pickleball-levelup.herokuapp.com/read/skill1"),
  //         builder: (_, snapshot) {
  //           if (snapshot.hasData) {
  //             String imageAddress =
  //                 "https://pickleball-levelup.herokuapp.com/read/skill1/${snapshot.data.thumbnail[0]}";
  //             return
  //           } else {
  //             return Container(
  //                 width: size.width * 0.9,
  //                 child:
  //                 Center(child: CircularProgressIndicator()));
  //           }
  //         },
  //       ),
  //
  //       ///Skill 2
  //       FutureBuilder(
  //         future: Server().getDataFromServer(
  //             url:
  //             "https://pickleball-levelup.herokuapp.com/read/skill2"),
  //         builder: (_, snapshot) {
  //           if (snapshot.hasData) {
  //             String imageAddress =
  //                 "https://pickleball-levelup.herokuapp.com/read/skill2/${snapshot.data.thumbnail[0]}";
  //             return CLBPSlide(
  //               image: imageAddress,
  //               desc: snapshot.data.description,
  //               title: snapshot.data.title,
  //               json: snapshot.data,
  //               onTap: () {
  //                 screenPush(
  //                     context,
  //                     CourseDetails(
  //                       json: snapshot.data,
  //                       trailer:
  //                       "https://pickleball-levelup.herokuapp.com/read/skill2/${snapshot.data.trailer[0]}",
  //                       thumbnail: imageAddress,
  //                       route: "/read/skill2",
  //                     ));
  //               },
  //             );
  //           } else {
  //             return Container();
  //           }
  //         },
  //       ),
  //
  //       ///Skill 3
  //       FutureBuilder(
  //         future: Server().getDataFromServer(
  //             url:
  //             "https://pickleball-levelup.herokuapp.com/read/skill3"),
  //         builder: (_, snapshot) {
  //           if (snapshot.hasData) {
  //             String imageAddress =
  //                 "https://pickleball-levelup.herokuapp.com/read/skill3/${snapshot.data.thumbnail[0]}";
  //             return CLBPSlide(
  //               image: imageAddress,
  //               desc: snapshot.data.description,
  //               title: snapshot.data.title,
  //               json: snapshot.data,
  //               onTap: () {
  //                 screenPush(
  //                     context,
  //                     CourseDetails(
  //                       json: snapshot.data,
  //                       trailer:
  //                       "https://pickleball-levelup.herokuapp.com/read/skill3/${snapshot.data.trailer[0]}",
  //                       thumbnail: imageAddress,
  //                       route: "/read/skill3",
  //                     ));
  //               },
  //             );
  //           } else if (snapshot.hasError) {
  //             print("error => " + snapshot.error);
  //             return Center(child: Text("${snapshot.error}"));
  //           } else {
  //             return Container();
  //           }
  //         },
  //       ),
  //
  //       ///Skill 4
  //       FutureBuilder(
  //         future: Server().getDataFromServer(
  //             url:
  //             "https://pickleball-levelup.herokuapp.com/read/skill4"),
  //         builder: (_, snapshot) {
  //           if (snapshot.hasData) {
  //             String imageAddress =
  //                 "https://pickleball-levelup.herokuapp.com/read/skill4/${snapshot.data.thumbnail[0]}";
  //             return CLBPSlide(
  //               image: imageAddress,
  //               desc: snapshot.data.description,
  //               title: snapshot.data.title,
  //               json: snapshot.data,
  //               onTap: () {
  //                 screenPush(
  //                     context,
  //                     CourseDetails(
  //                       json: snapshot.data,
  //                       trailer:
  //                       "https://pickleball-levelup.herokuapp.com/read/skill4/${snapshot.data.trailer[0]}",
  //                       thumbnail: imageAddress,
  //                       route: "/read/skill4",
  //                     ));
  //               },
  //             );
  //           } else {
  //             return Container();
  //           }
  //         },
  //       ),
  //
  //       ///Skill 5
  //       FutureBuilder(
  //         future: Server().getDataFromServer(
  //             url: "https://pickleball-levelup.herokuapp.com/read/skill5"),
  //         builder: (_, snapshot) {
  //           if (snapshot.hasData) {
  //             String imageAddress =
  //                 "https://pickleball-levelup.herokuapp.com/read/skill5/${snapshot.data.thumbnail[0]}";
  //             return CLBPSlide(
  //               image: imageAddress,
  //               desc: snapshot.data.description,
  //               title: snapshot.data.title,
  //               json: snapshot.data,
  //               onTap: () {
  //                 screenPush(
  //                     context,
  //                     CourseDetails(
  //                       json: snapshot.data,
  //                       trailer:
  //                       "https://pickleball-levelup.herokuapp.com/read/skill5/${snapshot.data.trailer[0]}",
  //                       thumbnail: imageAddress,
  //                       route: "/read/skill5",
  //                     ));
  //               },
  //             );
  //           } else {
  //             return Container();
  //           }
  //         },
  //       )
  //     ];
  //   }catch(e){
  //     print(e.toString());
  //   }
  // }
}
