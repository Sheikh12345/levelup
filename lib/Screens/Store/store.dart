import 'package:flutter/material.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:url_launcher/url_launcher.dart';


class Store extends StatefulWidget {
  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Store",
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.28,
                width: size.width * 0.95,
                color: Colors.grey,
                margin: EdgeInsets.only(top: size.height * 0.02),
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.28,
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage("assets/images/ball.jpeg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      height: size.height * 0.28,
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.07),
                      ),
                    ),
                    Positioned(
                        top: size.height * 0.02,
                        left: size.width * 0.5,
                        child: Text(
                          "Balls",
                          style: txtStylePop(
                              size: size.width * 0.08,
                              weight: FontWeight.w600,
                              color: Colors.white),
                        )),
                    Positioned(
                        top: size.height * 0.08,
                        left: size.width * 0.5,
                        child: Text(
                          "indoor and outdoor",
                          style: txtStylePop(
                              size: size.width * 0.03,
                              weight: FontWeight.w600,
                              color: Colors.white),
                        )),
                    Positioned(
                        top: size.height * 0.22,
                        left: size.width * 0.28,
                        child: Container(
                          height: size.height * 0.035,
                          width: size.width * 0.4,
                          child: MaterialButton(
                            elevation: 10,
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "SHOP FOR BALLS",
                              style: txtStylePop(
                                  color: Colors.black, weight: FontWeight.w600),
                            ),
                            onPressed: () {
                              _launchURL(
                                  "https://www.leveluppickleballcamps.com/balls");
                            },
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                height: size.height * 0.28,
                width: size.width * 0.95,
                color: Colors.grey,
                margin: EdgeInsets.only(top: size.height * 0.02),
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.28,
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage("assets/images/paddle.jpeg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      height: size.height * 0.28,
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.07),
                      ),
                    ),
                    Positioned(
                        top: size.height * 0.02,
                        left: size.width * 0.5,
                        child: Text(
                          "Paddle",
                          style: txtStylePop(
                              size: size.width * 0.08,
                              weight: FontWeight.w600,
                              color: Colors.white),
                        )),
                    Positioned(
                        top: size.height * 0.222,
                        left: size.width * 0.28,
                        child: Container(
                          height: size.height * 0.035,
                          child: RaisedButton(
                            elevation: 10,
                            color: Colors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(
                              "SHOP FOR Paddle",
                              style: txtStylePop(
                                  color: Colors.black, weight: FontWeight.w600),
                            ),
                            onPressed: () {
                              _launchURL(
                                  "https://www.leveluppickleballcamps.com/brands");
                            },
                          ),
                        ))
                  ],
                ),
              ),
              Container(
                height: size.height * 0.28,
                width: size.width * 0.95,
                color: Colors.grey,
                margin: EdgeInsets.only(top: size.height * 0.02),
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.28,
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: AssetImage("assets/images/wear.jpeg"),
                            fit: BoxFit.fill),
                      ),
                    ),
                    Container(
                      height: size.height * 0.28,
                      width: size.width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.07),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.02,
                      left: size.width * 0.6,
                      child: Text(
                        "Wear",
                        style: txtStylePop(
                            size: size.width * 0.08,
                            weight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.22,
                      left: size.width * 0.28,
                      child: Container(
                        height: size.height * 0.035,
                        width: size.width * 0.4,
                        child: RaisedButton(
                          elevation: 10,
                          color: Colors.white,
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Text(
                            "SHOP FOR Wear",
                            style: txtStylePop(
                                color: Colors.black, weight: FontWeight.w600),
                          ),
                          onPressed: () {
                            _launchURL(
                                "https://www.leveluppickleballcamps.com/shop-all?Collection=All");
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void _launchURL(String _url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
