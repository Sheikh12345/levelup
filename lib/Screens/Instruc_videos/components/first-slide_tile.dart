import 'package:flutter/material.dart';
import 'package:levelup/Style/appTextStyle.dart';

/// complete level based program
class CLBPSlide extends StatelessWidget {
  final title;
  final image;
  final desc;
  final json;
  final Function onTap;
  const CLBPSlide(
      {Key key, this.title, this.image, this.desc, this.json, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              margin: EdgeInsets.only(
                left: size.width * 0.04,
              ),
              height: size.height * 0.2,
              width: size.width * 0.65,
              decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    image: NetworkImage("$image"), fit: BoxFit.fill),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: Container(
                      width: size.width * 0.59,
                      height: size.height * 0.165,
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
                      width: size.width * 0.3,
                      child: Text(
                        "$title",
                        style: txtStyleCab(
                            color: Colors.white,
                            size: size.width * 0.045,
                            weight: FontWeight.w900),
                      ),
                    ),
                    top: size.height * 0.05,
                    left: size.width * 0.26,
                  ),
                  Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.1),
                      height: size.height * 0.03,
                      width: size.width * 0.2,
                      child: Image.asset("assets/images/iconwhite.png"),
                      color: Colors.black.withOpacity(0.1),
                    ),
                    top: size.height * 0.058,
                    left: size.width * 0.012,
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: size.width * 0.04,
            ),
            padding: EdgeInsets.only(
                left: size.width * 0.01, top: size.height * 0.005),
            child: Text(
              "$desc",
              style: TextStyle(
                  fontSize: size.width * 0.025,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4,
                  color: Colors.grey[900]),
            ),
            width: size.width * 0.68,
            height: size.height * 0.07,
          ),
        ],
      ),
    );
  }
}
