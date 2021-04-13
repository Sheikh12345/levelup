import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/Screens/Instruc_videos/instruc_video_online.dart';
import 'package:levelup/common/common.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      ),
    );
  }

  void _launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
