import 'package:flutter/material.dart';
import 'package:levelup/Services/database-server/server.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/common/common.dart';
import '../details/course_details_ild.dart';

class DGFSection extends StatefulWidget {
  @override
  _DGFSectionState createState() => _DGFSectionState();
}

class _DGFSectionState extends State<DGFSection> {
  bool status = false;




  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2),(){
      status = true;
      setState(() {
      });
    });
    Size size = MediaQuery.of(context).size;
    return  Container(
      margin: EdgeInsets.only(
        top: size.height * 0.01,
      ),
      height: size.height * 0.26,
      width: size.width,
      child: FutureBuilder(
        future: Server().getDgfDataFromServer(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.data.length,
                itemBuilder: (_, index) {
                  print("dgf ${snapshot.data.data[index].lessonName.toString()}");
                  return snapshot.data.data[index].lessonName.toString().toLowerCase().contains("dgf")?InkWell(
                    onTap: () {
                      screenPush(
                        context,
                          CourseDetailsIld(
                            link:
                            "https://pickleball-levelup.herokuapp.com/read/dgf/${snapshot.data.data[index].lessonName}/",
                            json: snapshot.data.data[index],
                            trailer:
                            "https://pickleball-levelup.herokuapp.com/read/dgf/${snapshot.data.data[index].lessonName}/${snapshot.data.data[index].data.trailer[0]}",
                            thumbnail:
                            "https://pickleball-levelup.herokuapp.com/read/dgf/${snapshot.data.data[index].lessonName}/${snapshot.data.data[index].data.thumbnail[0]}",
                            route: "${snapshot.data.data[index].lessonName}",
                          )
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                              left: size.width * 0.04,
                            ),
                            height: size.height * 0.2,
                            width: size.width * 0.65,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://pickleball-levelup.herokuapp.com/read/dgf/${snapshot.data.data[index].lessonName}/${snapshot.data.data[index].data.thumbnail[0]}"),
                                  fit: BoxFit.fill),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  child: Container(
                                    width: size.width * 0.59,
                                    height: size.height * 0.165,
                                    decoration: BoxDecoration(
                                        color: Colors.black
                                            .withOpacity(0.1),
                                        border: Border(
                                            top: BorderSide(
                                              color: Colors.white,
                                              width:
                                              size.width * 0.005,
                                            ),
                                            bottom: BorderSide(
                                              color: Colors.white,
                                              width:
                                              size.width * 0.005,
                                            ),
                                            left: BorderSide(
                                              color: Colors.white,
                                              width:
                                              size.width * 0.005,
                                            ),
                                            right: BorderSide(
                                              color: Colors.white,
                                              width:
                                              size.width * 0.005,
                                            ))),
                                  ),
                                  top: size.height * 0.018,
                                  left: size.width * 0.026,
                                ),
                                Positioned(
                                  child: Container(
                                    width: size.width * 0.34,
                                    child: Text(
                                      "${snapshot.data.data[index].data.title}",
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
                                    margin: EdgeInsets.only(
                                        top: size.height * 0.1),
                                    height: size.height * 0.03,
                                    width: size.width * 0.2,
                                    color:
                                    Colors.black.withOpacity(0.1),
                                    child: Image.asset(
                                        "assets/images/iconwhite.png"),
                                  ),
                                  top: size.height * 0.058,
                                  left: size.width * 0.012,
                                )
                              ],
                            )),
                        Container(
                          margin: EdgeInsets.only(
                            left: size.width * 0.04,
                          ),
                          padding: EdgeInsets.only(
                              left: size.width * 0.01,
                              top: size.height * 0.005),
                          child: Text(
                            "${snapshot.data.data[index].data.description}",
                            style: TextStyle(
                                fontSize: size.width * 0.025,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.4,
                                color: Colors.grey[900]),
                          ),
                          width: size.width * 0.68,
                          height: size.height * 0.06,
                        ),
                      ],
                    ),
                  ):Container();
                });
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
