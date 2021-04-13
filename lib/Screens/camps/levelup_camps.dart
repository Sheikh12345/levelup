 import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/common/common.dart';
import 'package:url_launcher/url_launcher.dart';

import 'camp_details.dart';

class CampsLevelUp extends StatefulWidget {
  @override
  _CampsLevelUpState createState() => _CampsLevelUpState();
}

class _CampsLevelUpState extends State<CampsLevelUp> {
  String _heading = "100 Camps in 35 States\n"
      "3-Days, 15 Hours of Instruction\n"
      "Low Student to Pro Ratio\n"
      "Top Instructors in the Sport";

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(

      appBar: AppBar(
        toolbarHeight: size.height*0.07,
        title: Text(
          "Upcoming Camps",
          style: txtStylePop(
            color: Colors.white,
            weight: FontWeight.w500,
            size: size.width*0.04
          ),
        ),
        backgroundColor: primaryClr,
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height*0.02+5),
                width: size.width,
                height: size.height * 0.25+10,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: size.height * 0.17,
                        width: size.width * 0.5,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/icon.png"))),
                      ),
                      left: size.width * 0.26,
                      bottom: size.height * 0.14,
                    ),
                    Positioned(
                      top: size.height * 0.11,
                      left: size.width * 0.1,
                      child: Container(
                        height: size.height * 0.25,
                        width: size.width * 0.8,
                        child: Text(
                          "$_heading",
                          style: GoogleFonts.pathwayGothicOne(
                              fontSize: size.height * 0.01 + 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.2),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.01),
                child: Text(
                  "CLICK ON MAP TO VIEW CAMP MAP",
                  style: txtStyleCab(
                    color: Colors.red[700],
                    size: size.width * 0.035,
                    weight: FontWeight.w900,
                  ),
                ),
              ),
              InkWell(
                onTap: (){
                  _launchURL("https://www.leveluppickleballcamps.com/camp-locations");
                },
                child: Container(
                  width: size.width * 0.7,
                  height: size.height * 0.27,
                  margin: EdgeInsets.only(top: size.height * 0.006),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/map.png"))),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.01),
                child: Text(
                  "UPCOMING CAMPS",
                  style: txtStylePop(
                    size: size.width * 0.04,
                    weight: FontWeight.w600,
                    color: Color(0xFFdfa82d),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height*0.01),
                height: size.height*0.11,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MonthBtn(text: "January",
                          month: "jan",),
                      MonthBtn(text: "February",
                    month: "feb",
                      ),
                      MonthBtn(text: "March",
                      month: "march",),
                      MonthBtn(text: "April",
                      month: "april",)
                    ],
                  ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MonthBtn(text: "May",
                        month: "may",),
                        MonthBtn(text: "June",
                        month: "june",),
                        MonthBtn(text: "July",
                        month: "july",),
                        MonthBtn(text: "August",
                        month: "aug",)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MonthBtn(text: "September",
                        month: "sep",),
                        MonthBtn(text: "October",
                        month: "oct",),
                        MonthBtn(text: "November",
                        month: "nov",),
                        MonthBtn(text: "December",
                        month: 'dec',)
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
  void _launchURL(String _url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}

class MonthBtn extends StatelessWidget {
  final String text;
  final onChanged;
  final month;
  const MonthBtn({Key key, this.text, this.onChanged, this.month}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap:(){
        screenPush(context, CampDetails(
          campMonth: "$month",
        ));
      },
      child: Container(
        alignment: Alignment.center,
        color: primaryClr,
        width: size.width * 0.18,
        height: size.height * 0.028,
        child: Text(
          "$text",
          style: txtStyleCab(
              color: Colors.white, size: size.width * 0.03,weight: FontWeight.w600),
        ),
      ),
    );
  }

}

