import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:levelup/Screens/Duets/duet_mode.dart';
import 'package:levelup/Screens/MyPurchases/regular_module.dart';
import 'package:levelup/Services/database-server/server.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/VideoPlayer/video_player.dart';
import 'package:levelup/common/common.dart';
import 'package:toast/toast.dart';

class CourseOverview extends StatefulWidget {
  final link;
  final imageLink;
  final title;
  final description;
  const CourseOverview(
      {Key key, this.link, this.imageLink, this.title, this.description})
      : super(key: key);
  @override
  _CourseOverviewState createState() => _CourseOverviewState();
}

class _CourseOverviewState extends State<CourseOverview>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            height: (size.height + size.height * 0.01),
            child: Column(
              children: [
                /// title bar
                Container(
                  color: primaryClr,
                  alignment: Alignment.center,
                  height: size.height * 0.07,
                  width: size.width,
                  child: Stack(
                    children: [
                      Positioned(
                        child: Text(
                          "COURSE CONTENT",
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
                        left: size.width * 0.3,
                        child: Container(
                          height: size.height * 0.005,
                          width: size.width * 0.382,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),

                /// thumbnail picture
                Container(
                  margin: EdgeInsets.all(
                    size.height * 0.01,
                  ),
                  height: size.height * 0.3,
                  width: size.width * 0.95,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    image: DecorationImage(
                        image: NetworkImage("${widget.imageLink}"),
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
                              ),
                            ),
                          ),
                        ),
                        top: size.height * 0.018,
                        left: size.width * 0.026,
                      ),
                      Positioned(
                        child: Container(
                          width: size.width * 0.7,
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                text: "${widget.title}",
                                style: txtStyleCab(
                                    color: Colors.white,
                                    size: size.width * 0.08,
                                    weight: FontWeight.w900),
                              ),
                            ]),
                          ),
                        ),
                        top: size.height * 0.06,
                        left: size.width * 0.3,
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
                      )
                    ],
                  ),
                ),

                /// Trailer button
                Container(
                  margin: EdgeInsets.only(
                      top: size.height * 0.01,
                      left: size.width * 0.13,
                      right: size.width * 0.13),
                  child: MaterialButton(
                    color: primaryClr,
                    onPressed: () {
                      screenPush(
                          context,
                          VideoPlayer(
                            address: "${widget.link}trailer.mp4",
                          ));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.slow_motion_video_sharp,
                          color: secondaryClrWhite,
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text(
                          "Program Trailer",
                          style: TextStyle(
                              color: secondaryClrWhite,
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.05),
                        ),
                      ],
                    ),
                  ),
                ),

                FutureBuilder(
                    future: Server().getIldData(url: widget.link),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          width: size.width,
                          height: size.height * 0.53,
                          child: Column(
                            children: [
                              Container(
                                width: size.width,
                                height: size.height * 0.05,
                                child: TabBar(
                                  indicatorColor: primaryClr,
                                  unselectedLabelColor: Colors.grey[700],
                                  controller: _controller,
                                  labelColor: Colors.black,
                                  labelPadding: EdgeInsets.only(
                                      bottom: size.height * 0.01),
                                  indicatorSize: TabBarIndicatorSize.label,
                                  labelStyle: txtStylePop(
                                      size: size.width * 0.035,
                                      color: Colors.black,
                                      letterSpacing: 0.8,
                                      weight: FontWeight.w500),
                                  tabs: [
                                    Text(" CURRICULUM   "),
                                    Text(" Bonus Videos    "),
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width,
                                height: size.height * 0.47,
                                child: TabBarView(
                                  controller: _controller,
                                  children: [
                                    /// Curriculum
                                    Container(
                                      width: size.width,
                                      height: size.height * 0.5,
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: size.height * 0.01),
                                          height: size.height * 0.495,
                                          width: size.width,
                                          child: ListView.builder(
                                              itemCount: snapshot
                                                  .data.videoDetail.length,
                                              itemBuilder: (_, index) {
                                                if (!snapshot
                                                    .data
                                                    .videoDetail[index]
                                                    .subCategory
                                                    .toString()
                                                    .contains("bonus")) {
                                                  return Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                            size.height * 0.01,
                                                          ),
                                                          height: size.height *
                                                              0.15,
                                                          width:
                                                              size.width * 0.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            image:
                                                                DecorationImage(
                                                                    image: MemoryImage(base64Decode(snapshot.data.videoDetail[index].thumbnail.substring(snapshot.data.videoDetail[index].thumbnail.indexOf(",")+1))),
                                                                    fit: BoxFit
                                                                        .fill),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      size.width *
                                                                          0.46,
                                                                  height:
                                                                      size.height *
                                                                          0.13,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                    border:
                                                                        Border(
                                                                      top:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .white,
                                                                        width: size.width *
                                                                            0.005,
                                                                      ),
                                                                      bottom:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .white,
                                                                        width: size.width *
                                                                            0.005,
                                                                      ),
                                                                      left:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .white,
                                                                        width: size.width *
                                                                            0.005,
                                                                      ),
                                                                      right:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .white,
                                                                        width: size.width *
                                                                            0.005,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                top:
                                                                    size.height *
                                                                        0.011,
                                                                left:
                                                                    size.width *
                                                                        0.016,
                                                              ),
                                                              Positioned(
                                                                child:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .play_circle_outline_sharp,
                                                                    color: Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0.8),
                                                                    size: size.width *
                                                                            0.07 +
                                                                        16,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    if (snapshot
                                                                        .data
                                                                        .videoDetail[
                                                                            index]
                                                                        .name
                                                                        .contains(
                                                                            "duet")) {
                                                                      print(snapshot
                                                                          .data
                                                                          .videoDetail[
                                                                              index]
                                                                          .name);
                                                                      screenPush(
                                                                          context,
                                                                          DuetMode(
                                                                            jsonData:
                                                                                snapshot.data,
                                                                            videoAddress:
                                                                                "${snapshot.data.videoDetail[index].name}",
                                                                          ));
                                                                    } else {
                                                                      screenPush(
                                                                          context,
                                                                          RegularModule(
                                                                            title:
                                                                                snapshot.data.videoDetail[index].name,
                                                                            desc:
                                                                                snapshot.data.videoDetail[index].description,
                                                                            link:
                                                                                widget.link,
                                                                            imageAddress:
                                                                                widget.imageLink,
                                                                            videoAddress:
                                                                                "${snapshot.data.videoDetail[index].name}",
                                                                          ));
                                                                    }
                                                                  },
                                                                ),
                                                                top:
                                                                    size.height *
                                                                        0.038,
                                                                left:
                                                                    size.width *
                                                                        0.17,
                                                              ),
                                                              Positioned(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets.only(
                                                                      top: size
                                                                              .height *
                                                                          0.05),
                                                                  height:
                                                                      size.height *
                                                                          0.047,
                                                                  width:
                                                                      size.width *
                                                                          0.12,
                                                                  child: Image
                                                                      .asset(
                                                                          "assets/images/iconwhite.png"),
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.1),
                                                                ),
                                                                top:
                                                                    size.height *
                                                                        0.06,
                                                                left:
                                                                    size.width *
                                                                        0.01,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              top: size.height *
                                                                  0.01),
                                                          width:
                                                              size.width * 0.45,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              RichText(
                                                                text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                          text:
                                                                              "${snapshot.data.videoDetail[index].name.toString().split(".").first}",
                                                                          style: txtStylePop(
                                                                              color: Colors.black,
                                                                              size: size.width * 0.024,
                                                                              weight: FontWeight.w600)),
                                                                      TextSpan(
                                                                          text:
                                                                              " (${int.parse(snapshot.data.videoDetail[index].duration.toString().split(".").first) ~/ 60} min  ${int.parse(snapshot.data.videoDetail[index].duration.toString().split(".").first)} sec) \n",
                                                                          style: txtStylePop(
                                                                              color: Colors.grey[600],
                                                                              size: size.width * 0.024,
                                                                              weight: FontWeight.w600)),
                                                                      TextSpan(
                                                                          text:
                                                                          "${snapshot.data.videoDetail[index].description.toString().length>135?snapshot.data.videoDetail[index].description.toString().substring(0, 135):snapshot.data.videoDetail[index].description.toString()}",
                                                                          style: txtStylePop(
                                                                              color: Colors.grey[600],
                                                                              size: size.width * 0.024,
                                                                              weight: FontWeight.w600)),
                                                                    ]),
                                                              ),
                                                              if (snapshot
                                                                  .data
                                                                  .videoDetail[
                                                                      index]
                                                                  .name
                                                                  .toString()
                                                                  .contains(
                                                                      "duet"))
                                                                InkWell(
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    margin: EdgeInsets.only(
                                                                        top: size.height *
                                                                            0.02,
                                                                        bottom: size.height *
                                                                            0.01),
                                                                    height: size
                                                                            .height *
                                                                        0.04,
                                                                    width:
                                                                        size.width *
                                                                            0.4,
                                                                    color:
                                                                        primaryClr,
                                                                    child: Text(
                                                                      "Video Duet",
                                                                      style: txtStyleCab(
                                                                          color: Colors
                                                                              .white,
                                                                          weight: FontWeight
                                                                              .w700,
                                                                          size: size.width *
                                                                              0.043),
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    // screenPush(
                                                                    //     context,
                                                                    // DuetMode(
                                                                    //   jsonData:
                                                                    //       snapshot.data,
                                                                    //   videoAddress:
                                                                    //       "${snapshot.data.videoDetail[index].name}",
                                                                    // ));
                                                                  },
                                                                )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  return Container();
                                                }
                                              })),
                                    ),

                                    /// Bonus Videos
                                    Container(
                                      width: size.width,
                                      height: size.height * 0.5,
                                      child: Container(
                                          margin: EdgeInsets.only(
                                              top: size.height * 0.01),
                                          height: size.height * 0.495,
                                          width: size.width,
                                          child: ListView.builder(
                                              itemCount: snapshot
                                                  .data.videoDetail.length,
                                              itemBuilder: (_, index) {
                                                if (snapshot
                                                    .data
                                                    .videoDetail[index]
                                                    .subCategory
                                                    .toString()
                                                    .contains("bonus")) {
                                                  return Container(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          margin:
                                                              EdgeInsets.all(
                                                            size.height * 0.01,
                                                          ),
                                                          height: size.height *
                                                              0.15,
                                                          width:
                                                              size.width * 0.5,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.green,
                                                            image: DecorationImage(
                                                                image:   MemoryImage(base64Decode(snapshot.data.videoDetail[index].thumbnail.substring(snapshot.data.videoDetail[index].thumbnail.indexOf(",")+1))),
                                                                fit: BoxFit
                                                                    .fill),
                                                          ),
                                                          child: Stack(
                                                            children: [
                                                              Positioned(
                                                                child:
                                                                    Container(
                                                                  width:
                                                                      size.width *
                                                                          0.46,
                                                                  height:
                                                                      size.height *
                                                                          0.13,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .transparent,
                                                                    border:
                                                                        Border(
                                                                      top:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .white,
                                                                        width: size.width *
                                                                            0.005,
                                                                      ),
                                                                      bottom:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .white,
                                                                        width: size.width *
                                                                            0.005,
                                                                      ),
                                                                      left:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .white,
                                                                        width: size.width *
                                                                            0.005,
                                                                      ),
                                                                      right:
                                                                          BorderSide(
                                                                        color: Colors
                                                                            .white,
                                                                        width: size.width *
                                                                            0.005,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                top:
                                                                    size.height *
                                                                        0.011,
                                                                left:
                                                                    size.width *
                                                                        0.016,
                                                              ),
                                                              Positioned(
                                                                child:
                                                                    IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .play_circle_outline_sharp,
                                                                    color: Colors
                                                                        .white
                                                                        .withOpacity(
                                                                            0.8),
                                                                    size: size.width *
                                                                            0.07 +
                                                                        16,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    if (snapshot
                                                                        .data
                                                                        .videoDetail[
                                                                            index]
                                                                        .name
                                                                        .contains(
                                                                            "duet")) {
                                                                      screenPush(
                                                                          context,
                                                                          DuetMode(
                                                                            jsonData:
                                                                                snapshot.data,
                                                                            videoAddress:
                                                                                "${snapshot.data.videoDetail[index].name}",
                                                                          ));
                                                                    } else {
                                                                      screenPush(
                                                                          context,
                                                                          RegularModule(
                                                                            title:
                                                                                snapshot.data.videoDetail[index].name,
                                                                            desc:
                                                                                snapshot.data.videoDetail[index].description,
                                                                            link:
                                                                                widget.link,
                                                                            imageAddress:
                                                                                widget.imageLink,
                                                                            videoAddress:
                                                                                "${snapshot.data.videoDetail[index].name}",
                                                                          ));
                                                                    }
                                                                  },
                                                                ),
                                                                top:
                                                                    size.height *
                                                                        0.038,
                                                                left:
                                                                    size.width *
                                                                        0.17,
                                                              ),
                                                              Positioned(
                                                                child:
                                                                    Container(
                                                                  margin: EdgeInsets.only(
                                                                      top: size
                                                                              .height *
                                                                          0.05),
                                                                  height:
                                                                      size.height *
                                                                          0.047,
                                                                  width:
                                                                      size.width *
                                                                          0.12,
                                                                  child: Image
                                                                      .asset(
                                                                          "assets/images/iconwhite.png"),
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.1),
                                                                ),
                                                                top:
                                                                    size.height *
                                                                        0.06,
                                                                left:
                                                                    size.width *
                                                                        0.01,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              top: size.height *
                                                                  0.01),
                                                          width:
                                                              size.width * 0.45,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              RichText(
                                                                text: TextSpan(
                                                                    children: [
                                                                      TextSpan(
                                                                          text:
                                                                              "${snapshot.data.videoDetail[index].name.toString().split(".").first}",
                                                                          style: txtStylePop(
                                                                              color: Colors.black,
                                                                              size: size.width * 0.024,
                                                                              weight: FontWeight.w600)),
                                                                      TextSpan(
                                                                          text:
                                                                              " (${int.parse(snapshot.data.videoDetail[index].duration.toString().split(".").first) ~/ 60} min  ${int.parse(snapshot.data.videoDetail[index].duration.toString().split(".").first)} sec) \n",
                                                                          style: txtStylePop(
                                                                              color: Colors.grey[600],
                                                                              size: size.width * 0.024,
                                                                              weight: FontWeight.w600)),
                                                                      TextSpan(
                                                                          text:
                                                                          "${snapshot.data.videoDetail[index].description.toString().length>135?snapshot.data.videoDetail[index].description.toString().substring(0, 135):snapshot.data.videoDetail[index].description.toString()}",
                                                                          style: txtStylePop(
                                                                              color: Colors.grey[600],
                                                                              size: size.width * 0.024,
                                                                              weight: FontWeight.w600)),
                                                                    ]),
                                                              ),
                                                              if (snapshot
                                                                  .data
                                                                  .videoDetail[
                                                                      index]
                                                                  .name
                                                                  .toString()
                                                                  .contains(
                                                                      "duet"))
                                                                InkWell(
                                                                  child:
                                                                      Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    margin: EdgeInsets.only(
                                                                        top: size.height *
                                                                            0.02,
                                                                        bottom: size.height *
                                                                            0.01),
                                                                    height: size
                                                                            .height *
                                                                        0.04,
                                                                    width:
                                                                        size.width *
                                                                            0.4,
                                                                    color:
                                                                        primaryClr,
                                                                    child: Text(
                                                                      "Video Duet",
                                                                      style: txtStyleCab(
                                                                          color: Colors
                                                                              .white,
                                                                          weight: FontWeight
                                                                              .w700,
                                                                          size: size.width *
                                                                              0.043),
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    screenPush(
                                                                        context,
                                                                        DuetMode(
                                                                          jsonData:
                                                                              snapshot.data,
                                                                          videoAddress:
                                                                              "${snapshot.data.videoDetail[index].name}",
                                                                        ));
                                                                  },
                                                                )
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                } else {
                                                  return Container();
                                                }
                                              })),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text("Network Error"));
                      } else {
                        return CircularProgressIndicator();
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  descText(String text) {
    if (text.toString().length > 135) {
      return text.toString().substring(0, 135);
    } else {
      return text;
    }
  }
}
