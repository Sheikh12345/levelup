import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:levelup/Services/database-server/server.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/VideoPlayer/video_player.dart';
import 'package:levelup/common/common.dart';


class RegularModule extends StatefulWidget {
  final String videoAddress;
  final jsonData;
  const RegularModule({Key key, this.videoAddress, this.jsonData}) : super(key: key);
  @override
  _RegularModuleState createState() => _RegularModuleState();
}

class _RegularModuleState extends State<RegularModule> {
  String _serverUrl ="https://pickleball-levelup.herokuapp.com";
  String _descr = "Serving\n"
      "1. Position yourself so that you are prepared to\n"
      "hit a forehand drop/drive on your next shot\n\n"
      " 2. Beginner Serving: Face your torso towards\n"
      "your target\n\n"
      "1. Position yourself so that you are prepared to\n"
      "hit a forehand drop/drive on your next shot\n\n"
      "2. Beginner Serving: Face your torso towards\n"
      "your target\n\n"
      "1. Position yourself so that you are prepared to\n"
      "hit a forehand drop/drive on your next shot\n\n"
      "2. Beginner Serving: Face your torso towards\n"
      "your target\n\n";
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
                          Server().getDataFromServer();
                          screenPush(
                              context,
                              VideoPlayer(
                                address:"$_serverUrl${widget.jsonData["address"]}/${widget.videoAddress}",
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
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.03),
                child: Text(
                  "$_descr",
                  style: txtStylePop(
                      size: size.width * 0.03,
                      weight: FontWeight.w600,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
