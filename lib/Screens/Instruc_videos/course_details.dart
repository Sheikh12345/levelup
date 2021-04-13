import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levelup/DataModel/Stripe_model.dart';
import 'package:levelup/Services/StripePayment/payment_home.dart';
import 'package:levelup/Services/StripePayment/stripe_service.dart';
import 'package:levelup/Services/database-server/server.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/VideoPlayer/video_player.dart';
import 'package:levelup/common/common.dart';

class CourseDetails extends StatefulWidget {
  final trailer;
  final json;
  final thumbnail;
  final route;
  final myPurchases;
  const CourseDetails(
      {Key key,
      this.json,
      this.trailer,
      this.thumbnail,
      this.route,
      this.myPurchases})
      : super(key: key);

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height * 0.1,
            width: size.width,
            color: primaryClr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                coursesList.contains(widget.route)? Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      top: size.height * 0.05 + 4,
                      bottom: size.height * 0.01,
                      right: size.width * 0.08),
                  height: size.height * 0.04,
                  width: size.width * 0.6,
                  child: Text(
                    "Available in my purchases",
                    style: TextStyle(
                        color: secondaryClrWhite,
                        fontSize: size.height * 0.02,
                        fontWeight: FontWeight.w600),
                  ),
                  padding: EdgeInsets.only(
                      top: size.height * 0.002,
                      left: size.width * 0.01,
                      bottom: size.height * 0.003),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.width * 0.01),
                      border: Border(
                          top: BorderSide(
                              color: secondaryClrWhite.withOpacity(0.8),
                              width: size.width * 0.007),
                          left: BorderSide(
                              color: secondaryClrWhite.withOpacity(0.8),
                              width: size.width * 0.007),
                          right: BorderSide(
                              color: secondaryClrWhite.withOpacity(0.8),
                              width: size.width * 0.007),
                          bottom: BorderSide(
                              color: secondaryClrWhite.withOpacity(0.8),
                              width: size.width * 0.007))),
                ):InkWell(
                  onTap: () {
                    screenPush(
                        context,
                        PaymentHome(
                          amount: widget.json.price.toString(),
                          courseRoute: widget.route,
                          json: widget.json,
                        ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                        top: size.height * 0.05 + 4,
                        bottom: size.height * 0.01,
                        right: size.width * 0.08),
                    height: size.height * 0.04,
                    width: size.width * 0.4,
                    child: Text(
                      "PURCHASE  \$${widget.json.price}",
                      style: TextStyle(
                          color: secondaryClrWhite,
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.w600),
                    ),
                    padding: EdgeInsets.only(
                        top: size.height * 0.002,
                        left: size.width * 0.01,
                        bottom: size.height * 0.003),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size.width * 0.01),
                        border: Border(
                            top: BorderSide(
                                color: secondaryClrWhite.withOpacity(0.8),
                                width: size.width * 0.007),
                            left: BorderSide(
                                color: secondaryClrWhite.withOpacity(0.8),
                                width: size.width * 0.007),
                            right: BorderSide(
                                color: secondaryClrWhite.withOpacity(0.8),
                                width: size.width * 0.007),
                            bottom: BorderSide(
                                color: secondaryClrWhite.withOpacity(0.8),
                                width: size.width * 0.007))),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      height: size.height * 0.3,
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                            image: NetworkImage("${widget.thumbnail}"),
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
                              width: size.width * 0.6,
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: "${widget.json.title}",
                                    style: txtStyleCab(
                                        color: Colors.white,
                                        size: size.width * 0.08,
                                        weight: FontWeight.w900),
                                  ),
                                ]),
                              ),
                            ),
                            top: size.height * 0.07,
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
                      )),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.01),
                    child: Text(
                      "GETTING STARTED - Designed for Beginner Players - Skill Level 1.0-1.9",
                      style: TextStyle(
                          fontSize: size.width * 0.026,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: 0.5),
                    ),
                  ),
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
                              address: widget.trailer,
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
                            "Watch Trailer",
                            style: TextStyle(
                                color: secondaryClrWhite,
                                fontWeight: FontWeight.w600,
                                fontSize: size.width * 0.05),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.015),
                    child: Text(
                      "51 Minutes / ${widget.json.data.length} Videos / Includes Personal Video Duets",
                      style: TextStyle(
                          fontSize: size.width * 0.026,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[800],
                          letterSpacing: 0.5),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.01),
                    height: size.height * 0.0024,
                    width: size.width * 0.78,
                    color: Colors.grey[500],
                  ),
                  Container(
                    width: size.width * 0.78,
                    margin: EdgeInsets.only(top: size.height * 0.015),
                    child: Text(
                      "${widget.json.description}",
                      style: TextStyle(
                          fontSize: size.width * 0.026,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: 0.5),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: Container(
                      margin: EdgeInsets.only(bottom: size.height * 0.01),
                      padding: EdgeInsets.all(size.width * 0.05),
                      color: Colors.white60,
                      child: Column(
                        children: [
                          Container(
                            width: size.width * 0.78,
                            margin: EdgeInsets.only(top: size.height * 0.015),
                            child: Text(
                              "CURRICULUM",
                              style: TextStyle(
                                  fontSize: size.width * 0.035,
                                  fontWeight: FontWeight.w600,
                                  color: primaryClr,
                                  letterSpacing: 0.5),
                            ),
                          ),
                          Container(
                            height: size.height *
                                (0.1 + ((widget.json.data.length + 1) * 0.015)),
                            width: size.width * 0.78,
                            child: Stack(
                              children: [
                                ListView.builder(
                                    itemCount: widget.json.data.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        width: size.width * 0.7,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: Text(
                                                "${widget.json.data[index]}",
                                                style: txtStylePop(
                                                    size: size.width * 0.03,
                                                    color: Colors.black,
                                                    weight: FontWeight.w500),
                                              ),
                                              width: size.width * 0.43,
                                            ),
                                            Container(
                                              width: size.width * 0.23,
                                              child: Text(
                                                "${widget.json.data.length} minutes",
                                                style: txtStylePop(
                                                    size: size.width * 0.03,
                                                    color: Colors.black,
                                                    weight: FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                              ],
                            ),
                          ),
                          Visibility(
                            visible:
                                widget.json.bonus.length == 0 ? false : true,
                            child: Container(
                              width: size.width * 0.78,
                              margin: EdgeInsets.only(
                                  top: size.height * 0.015,
                                  bottom: size.height * 0.005),
                              child: Text(
                                "BONUS VIDEOS",
                                style: TextStyle(
                                    fontSize: size.width * 0.035,
                                    fontWeight: FontWeight.w600,
                                    color: primaryClr,
                                    letterSpacing: 0.5),
                              ),
                            ),
                          ),
                          Container(
                              height: size.height * 0.07 +
                                  (widget.json.bonus.length) * 6,
                              width: size.width * 0.78,
                              child: Stack(
                                children: [
                                  ListView.builder(
                                      itemCount: widget.json.bonus.length,
                                      itemBuilder: (context, index) {
                                        return Container(
                                          width: size.width * 0.7,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${widget.json.bonus[index]}",
                                                style: txtStylePop(
                                                    size: size.width * 0.03,
                                                    color: Colors.black,
                                                    weight: FontWeight.w500),
                                              ),
                                              Text(
                                                "${widget.json.bonus.length} minutes",
                                                style: txtStylePop(
                                                    size: size.width * 0.03,
                                                    color: Colors.black,
                                                    weight: FontWeight.w500),
                                              ),
                                            ],
                                          ),
                                        );
                                      }),
                                ],
                              )),
                          Container(
                            margin: EdgeInsets.only(
                              top: size.height * 0.02,
                            ),
                            height: size.height * 0.0024,
                            width: size.width * 0.78,
                            color: Colors.grey[500],
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: size.width * 0.78,
                            margin:
                                EdgeInsets.only(bottom: size.height * 0.001),
                            child: Text(
                              "\$${widget.json.price}",
                              style: TextStyle(
                                  fontSize: size.width * 0.04,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black,
                                  letterSpacing: 0.5),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.005,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
