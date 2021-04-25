import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levelup/Screens/Instruc_videos/components/second_section_ilvd.dart';
import 'package:levelup/Screens/Instruc_videos/components/third_section_dgf.dart';
import 'package:levelup/Services/database-server/server.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/common/common.dart';

import 'components/first-slide_tile.dart';
import 'details/course_details.dart';
import 'details/course_details_ild.dart';

class ShopForVideos extends StatefulWidget {
  @override
  _ShopForVideosState createState() => _ShopForVideosState();
}

class _ShopForVideosState extends State<ShopForVideos> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.003),
          child: ListView(
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
                height: size.height * 0.9,
                width: size.width,
                child: FutureBuilder(
                  future: Server().getSkillDataFromServer1(),
                  builder: (_, snapshot) {
                    String imageAddress =
                        "https://pickleball-levelup.herokuapp.com/read/skill";
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Expanded(
                            child: ListView(
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
                                          link:
                                              "https://pickleball-levelup.herokuapp.com/read/skill1/",
                                          json: snapshot.data.skill1,
                                          trailer:
                                              "https://pickleball-levelup.herokuapp.com/read/skill1/${snapshot.data.skill1.trailer[0]}",
                                          thumbnail:
                                              "${imageAddress}1/thumbnail.jpg",
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
                                        link:
                                            "https://pickleball-levelup.herokuapp.com/read/skill2/",
                                        json: snapshot.data.skill2,
                                        trailer:
                                            "https://pickleball-levelup.herokuapp.com/read/skill2/${snapshot.data.skill2.trailer[0]}",
                                        thumbnail:
                                            "${imageAddress}2/thumbnail.jpg",
                                        route: "/read/skill2",
                                      ),
                                    );
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
                                        link:
                                            "https://pickleball-levelup.herokuapp.com/read/skill3/",
                                        json: snapshot.data.skill3,
                                        trailer:
                                            "https://pickleball-levelup.herokuapp.com/read/skill3/${snapshot.data.skill3.trailer[0]}",
                                        thumbnail:
                                            "${imageAddress}3/thumbnail.jpg",
                                        route: "/read/skill3",
                                      ),
                                    );
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
                                        link:
                                            "https://pickleball-levelup.herokuapp.com/read/skill4/",
                                        json: snapshot.data.skill4,
                                        trailer:
                                            "https://pickleball-levelup.herokuapp.com/read/skill4/${snapshot.data.skill4.trailer[0]}",
                                        thumbnail:
                                            "${imageAddress}4/thumbnail.jpg",
                                        route: "/read/skill4",
                                      ),
                                    );
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
                                        link:
                                            "https://pickleball-levelup.herokuapp.com/read/skill5/",
                                        trailer:
                                            "https://pickleball-levelup.herokuapp.com/read/skill5/${snapshot.data.skill5.trailer[0]}",
                                        thumbnail:
                                            "${imageAddress}5/thumbnail.jpg",
                                        route: "/read/skill5",
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),

                          /// title second Section
                          Container(
                            width: size.width,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                              left: size.width * 0.04,
                            ),
                            child: Text(
                              "INDIVIDUAL LESSONS & VIDEO DUETS",
                              style: txtStyleCab(
                                  size: size.width * 0.04,
                                  weight: FontWeight.w900,
                                  color: Colors.grey[600]),
                            ),
                          ),
                          ILDSSection(),
                          /// title third Section
                          Container(
                            width: size.width,
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(
                              left: size.width * 0.04,
                            ),
                            child: Text(
                              "DRILLS, GAMES & FITNESS",
                              style: txtStyleCab(
                                  size: size.width * 0.04,
                                  weight: FontWeight.w900,
                                  color: Colors.grey[600]),
                            ),
                          ),
                          Expanded(child: DGFSection())
                        ],
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Center(
                        child: Text("Network Error"),
                      );
                    }
                  },
                ),
              ),

              //

              //
              // ///Third Slide Section
              // DGFSection(),
            ],
          )),
    ));
  }
}
