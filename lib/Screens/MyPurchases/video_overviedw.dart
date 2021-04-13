import 'package:flutter/material.dart';
import 'package:levelup/Screens/Duets/duet_mode.dart';
import 'package:levelup/Screens/MyPurchases/regular_module.dart';
import 'package:levelup/Services/database-server/server.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/VideoPlayer/video_player.dart';
import 'package:levelup/common/common.dart';
import 'package:toast/toast.dart';

class VideoOverview extends StatefulWidget {
  final jsonData;

  const VideoOverview({Key key, this.jsonData}) : super(key: key);
  @override
  _VideoOverviewState createState() => _VideoOverviewState();
}

class _VideoOverviewState extends State<VideoOverview> {
  List titleHeading = ["History of Picklebal ", "Serving ", "Serving Duet "];
  List titleTime = ["(4 Min)", "(4 Min)", "(1 Min)"];
  String _serverUrl ="https://pickleball-levelup.herokuapp.com";

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
                      image:NetworkImage("$_serverUrl${widget.jsonData["address"]}/${widget.jsonData["thumbnail"][0]}"),
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
                        width: size.width*0.7,
                        child: RichText(
                          text: TextSpan(children: [

                            TextSpan(
                              text: "${widget.jsonData["title"]}",
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
                    screenPush(context, VideoPlayer(address: "$_serverUrl${widget.jsonData["address"]}/${widget.jsonData["trailer"][0]}",));
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

            Container(
              width: size.width,
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: size.width*0.03,top: size.height*0.01),
              child: Text("Curriculum videos",style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: size.width*0.05
              ),),
            ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.01),
                height: size.height * 0.495,
                width: size.width,
                child: ListView.builder(
                    itemCount: widget.jsonData["data"].length,
                    itemBuilder: (_, index) {
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(
                                size.height * 0.01,
                              ),
                              height: size.height * 0.15,
                              width: size.width * 0.5,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                image: DecorationImage(                               /// "${widget.jsonData["data"][index]}",
                                    image: NetworkImage("$_serverUrl${widget.jsonData["address"]}/${widget.jsonData["thumbnail"][0]}"),
                                    fit: BoxFit.fill),
                              ),
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Container(
                                      width: size.width * 0.46,
                                      height: size.height * 0.13,
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
                                    top: size.height * 0.011,
                                    left: size.width * 0.016,
                                  ),
                                  Positioned(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.play_circle_outline_sharp,
                                        color:
                                        Colors.white.withOpacity(0.8),
                                        size: size.width * 0.07 + 16,
                                      ),
                                      onPressed: () {
                                        if (widget.jsonData["data"][index]
                                            .toString()
                                            .contains("duet")) {
                                          screenPush(context, DuetMode(
                                            jsonData: widget.jsonData,
                                            videoAddress:
                                            "${widget.jsonData["data"][index]}",
                                          ));
                                        } else {
                                          screenPush(
                                              context,
                                              RegularModule(
                                                jsonData: widget.jsonData,
                                                videoAddress:
                                                "${widget.jsonData["data"][index]}",
                                              ));
                                        }
                                      },
                                    ),
                                    top: size.height * 0.038,
                                    left: size.width * 0.17,
                                  ),
                                  Positioned(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: size.height * 0.05),
                                      height: size.height * 0.047,
                                      width: size.width * 0.12,
                                      child: Image.asset(
                                          "assets/images/iconwhite.png"),
                                      color:
                                      Colors.black.withOpacity(0.1),
                                    ),
                                    top: size.height * 0.06,
                                    left: size.width * 0.01,
                                  )
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  top: size.height * 0.01),
                              width: size.width * 0.45,
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.start,
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: "${widget.jsonData["data"][index].toString().substring(0,widget.jsonData["data"][index].toString().indexOf("."))}",
                                          style: txtStylePop(
                                              color: Colors.black,
                                              size: size.width * 0.024,
                                              weight: FontWeight.w600)),
                                      TextSpan(
                                          text:
                                          " (${widget.jsonData["data"].length} min) \n",
                                          style: txtStylePop(
                                              color: Colors.grey[600],
                                              size: size.width * 0.024,
                                              weight: FontWeight.w600)),
                                      TextSpan(
                                          text:
                                          "Instructor: Wayne Dollard In this video, you will learn the history of pickleball and blah blaah blah",
                                          style: txtStylePop(
                                              color: Colors.grey[600],
                                              size: size.width * 0.024,
                                              weight: FontWeight.w600)),
                                    ]),
                                  ),
                                  if (widget.jsonData["data"][index]
                                      .toString()
                                      .contains("duet"))
                                    InkWell(
                                      child: Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                            top: size.height * 0.02),
                                        height: size.height * 0.04,
                                        width: size.width * 0.4,
                                        color: primaryClr,
                                        child: Text(
                                          "Video Duet",
                                          style: txtStyleCab(
                                              color: Colors.white,
                                              weight: FontWeight.w700,
                                              size: size.width * 0.043),
                                        ),
                                      ),
                                      onTap: () {
                                        screenPush(context, DuetMode(
                                          jsonData: widget.jsonData,
                                          videoAddress:
                                          "${widget.jsonData["data"][index]}",
                                        ));
                                      },
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })
              ),
               widget.jsonData["bonus"].length>0?  Container(
                 width: size.width,
                 alignment: Alignment.centerLeft,
                 margin: EdgeInsets.only(left: size.width*0.03,top: size.height*0.01),
                 child: Text("Bonus videos",style: TextStyle(
                     color: Colors.black,
                     fontWeight: FontWeight.w500,
                     fontSize: size.width*0.05
                 ),),
               ):Container(),

              /// Bonus Videos
              Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  height: size.height * 0.495,
                  width: size.width,
                  child: ListView.builder(
                      itemCount: widget.jsonData["bonus"].length,
                      itemBuilder: (_, index) {
                        return Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.all(
                                  size.height * 0.01,
                                ),
                                height: size.height * 0.15,
                                width: size.width * 0.5,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  image: DecorationImage(                               /// "${widget.jsonData["data"][index]}",
                                      image: NetworkImage("$_serverUrl${widget.jsonData["address"]}/${widget.jsonData["thumbnail"][0]}"),
                                      fit: BoxFit.fill),
                                ),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      child: Container(
                                        width: size.width * 0.46,
                                        height: size.height * 0.13,
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
                                      top: size.height * 0.011,
                                      left: size.width * 0.016,
                                    ),
                                    Positioned(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.play_circle_outline_sharp,
                                          color:
                                          Colors.white.withOpacity(0.8),
                                          size: size.width * 0.07 + 16,
                                        ),
                                        onPressed: () {
                                          if (widget.jsonData["bonus"][index]
                                              .toString()
                                              .contains("duet")) {
                                            screenPush(context, DuetMode(
                                              jsonData: widget.jsonData,
                                              videoAddress:
                                              "${widget.jsonData["bonus"][index]}",
                                            ));
                                          } else {
                                            screenPush(
                                                context,
                                                RegularModule(
                                                  jsonData: widget.jsonData,
                                                  videoAddress:
                                                  "${widget.jsonData["bonus"][index]}",
                                                ));
                                          }
                                        },
                                      ),
                                      top: size.height * 0.038,
                                      left: size.width * 0.17,
                                    ),
                                    Positioned(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: size.height * 0.05),
                                        height: size.height * 0.047,
                                        width: size.width * 0.12,
                                        child: Image.asset(
                                            "assets/images/iconwhite.png"),
                                        color:
                                        Colors.black.withOpacity(0.1),
                                      ),
                                      top: size.height * 0.06,
                                      left: size.width * 0.01,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: size.height * 0.01),
                                width: size.width * 0.45,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                            text: "${widget.jsonData["bonus"][index].toString().substring(0,widget.jsonData["data"][index].toString().indexOf("."))}",
                                            style: txtStylePop(
                                                color: Colors.black,
                                                size: size.width * 0.024,
                                                weight: FontWeight.w600)),
                                        TextSpan(
                                            text:
                                            " (${widget.jsonData["bonus"].length} min) \n",
                                            style: txtStylePop(
                                                color: Colors.grey[600],
                                                size: size.width * 0.024,
                                                weight: FontWeight.w600)),
                                        TextSpan(
                                            text:
                                            "Instructor: Wayne Dollard In this video, you will learn the history of pickleball and blah blaah blah",
                                            style: txtStylePop(
                                                color: Colors.grey[600],
                                                size: size.width * 0.024,
                                                weight: FontWeight.w600)),
                                      ]),
                                    ),
                                    if (widget.jsonData["bonus"][index]
                                        .toString()
                                        .contains("duet"))
                                      InkWell(
                                        child: Container(
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.only(
                                              top: size.height * 0.02),
                                          height: size.height * 0.04,
                                          width: size.width * 0.4,
                                          color: primaryClr,
                                          child: Text(
                                            "Video Duet",
                                            style: txtStyleCab(
                                                color: Colors.white,
                                                weight: FontWeight.w700,
                                                size: size.width * 0.043),
                                          ),
                                        ),
                                        onTap: () {
                                          screenPush(context, DuetMode(
                                            jsonData: widget.jsonData,
                                            videoAddress:
                                            "${widget.jsonData["bonus"][index]}",
                                          ));
                                        },
                                      )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      })
              ),
            ],
          ),
        ),
      ),
    );
  }
}
