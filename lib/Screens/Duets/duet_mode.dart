

import 'package:flutter/material.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/VideoPlayer/video_player.dart';
import 'package:levelup/common/common.dart';

class DuetMode extends StatefulWidget {
  final String videoAddress;
  final jsonData;

  const DuetMode({Key key, this.videoAddress, this.jsonData}) : super(key: key);
  @override
  _DuetModeState createState() => _DuetModeState();
}

class _DuetModeState extends State<DuetMode> {
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
                      ))
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
                      image: AssetImage("assets/images/skill1.png"),
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
                      child: IconButton(
                        onPressed: (){
                     screenPush(context, VideoPlayer(
                       address:"$_serverUrl${widget.jsonData["address"]}/${widget.videoAddress}",
                     ));
                        },
                        icon: Icon(
                          Icons.play_circle_outline,
                          color: Colors.white.withOpacity(0.8),
                          size: size.width * 0.07 + 30,
                        ),
                      ),
                      top: size.height * 0.07 + 80,
                      left: size.width * 0.07 + 240,
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
                )),
            Container(
              margin: EdgeInsets.symmetric(
               horizontal: size.width * 0.03,
              ),

              height: size.height*0.054,
              width: size.width,
              child:  RichText(
                text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Serving Position and Form - Duet Tips\n",
                        style: txtStyleCab(weight: FontWeight.w600,
                        size: size.width*0.03,
                        color: Colors.black,
                        )
                      ),
                      TextSpan(text:"Duration of Program / Number of Videos / Dueting Duration of Program"
                          " / Number of Videos / Dueting Duration of Program / Number of Videos",
                          style: txtStyleCab(weight: FontWeight.w400,
                            size: size.width*0.022,
                            color: Colors.black,
                          ))
                    ]
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: size.width * 0.13,
                  right: size.width * 0.13),
              child: MaterialButton(
                color: primaryClr,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Icon(
                          Icons.fiber_manual_record_outlined,
                          color: secondaryClrWhite,
                          size: size.width*0.09,
                        ),
                        Positioned(
                          top: size.height*0.0082,
                          left: size.width*0.017,
                          child: Icon(
                            Icons.fiber_manual_record_outlined,
                            color: secondaryClrWhite,
                            size: size.width*0.055,
                          ),
                        ),
                        Positioned(
                          top: size.height*0.013,
                          left: size.width*0.025,
                          child: Icon(
                            Icons.fiber_manual_record,
                            color: Colors.red,
                            size: size.width*0.04,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      "Record Your Duet",
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
             margin: EdgeInsets.only(left: size.width*0.05,bottom: size.height*0.004,  top: size.height*0.01),
               width: size.width,
               child: Text("February 12, 2021",style: txtStyleCab(color: Colors.grey[800],
               size: size.width*0.028),)),
           Stack(children: [
             Container(
               width: size.width*0.9,
               height: size.height*0.3,
               color: Colors.grey,
               child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     height: size.height*0.3,
                     width: size.width*0.45,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                           image: AssetImage("assets/images/duet.png")
                       ),
                         border: Border(
                             top: BorderSide(
                                 color: Colors.black,
                                 width: size.width*.005
                             ),
                             left: BorderSide(
                                 color: Colors.black,
                                 width: size.width*.005
                             ),
                             bottom: BorderSide(
                                 color: Colors.black,
                                 width: size.width*.005
                             ),
                             right: BorderSide(
                                 color: Colors.black,
                                 width: size.width*.002
                             )
                         )
                     ),
                   ),
                   Container(
                     height: size.height*0.3,
                     width: size.width*0.45,
                     decoration: BoxDecoration(
                       image: DecorationImage(
                           image: AssetImage("assets/images/duet.png"),

                       ),
                         border: Border(
                             top: BorderSide(
                                 color: Colors.black,
                                 width: size.width*.005
                             ),
                             left: BorderSide(
                                 color: Colors.black,
                                 width: size.width*.002
                             ),
                             bottom: BorderSide(
                                 color: Colors.black,
                                 width: size.width*.005
                             ),
                             right: BorderSide(
                                 color: Colors.black,
                                 width: size.width*.005
                             )
                         )
                     ),
                   ),
                 ],
               ),
             ),
             Positioned(
                 left: size.width*0.78,
                 child: IconButton(
               icon:Icon( Icons.favorite,color: Colors.white,size: size.width*0.07,),
             ))
           ],),
            Container(
                margin: EdgeInsets.only(left: size.width*0.05,bottom: size.height*0.004,
                top: size.height*0.01
                ),
                width: size.width,
                child: Text("February 12, 2021",style: txtStyleCab(color: Colors.grey[800],
                    size: size.width*0.028),)),
            Stack(children: [
              Container(
                width: size.width*0.9,
                height: size.height*0.3,
                color: Colors.grey,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: size.height*0.3,
                      width: size.width*0.45,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/duet.png")
                          ),
                          border: Border(
                              top: BorderSide(
                                  color: Colors.black,
                                  width: size.width*.005
                              ),
                              left: BorderSide(
                                  color: Colors.black,
                                  width: size.width*.005
                              ),
                              bottom: BorderSide(
                                  color: Colors.black,
                                  width: size.width*.005
                              ),
                              right: BorderSide(
                                  color: Colors.black,
                                  width: size.width*.002
                              )
                          )
                      ),
                    ),
                    Container(
                      height: size.height*0.3,
                      width: size.width*0.45,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/duet.png"),

                          ),
                          border: Border(
                              top: BorderSide(
                                  color: Colors.black,
                                  width: size.width*.005
                              ),
                              left: BorderSide(
                                  color: Colors.black,
                                  width: size.width*.002
                              ),
                              bottom: BorderSide(
                                  color: Colors.black,
                                  width: size.width*.005
                              ),
                              right: BorderSide(
                                  color: Colors.black,
                                  width: size.width*.005
                              )
                          )
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  left: size.width*0.78,
                  child: IconButton(
                    icon:Icon( Icons.favorite,color: Colors.red,size: size.width*0.07,),
                  ))
            ],),
          ],
        ),
      ),
    ));
  }
}
