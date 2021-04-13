import 'package:flutter/material.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';

class Viewing extends StatefulWidget {
  @override
  _ViewingState createState() => _ViewingState();
}

class _ViewingState extends State<Viewing> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          "Videos",
          style: txtStylePop(
            color: Colors.white,
            weight: FontWeight.w500,
          ),
        ),
        backgroundColor: primaryClr,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Container(
              //   margin: EdgeInsets.only(top: size.height * 0.01),
              //   height: size.height * 0.3,
              //   child: Column(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.only(
              //           left: size.width * 0.05,
              //           right: size.width * 0.05,
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text(
              //               "February 23, 2021",
              //               style: txtStylePop(
              //                   weight: FontWeight.w500,
              //                   size: size.width * 0.022,
              //                   color: Colors.grey[800],
              //                   letterSpacing: 0.7),
              //             ),
              //             Text(
              //               "Overhead Drills",
              //               style: txtStylePop(
              //                   weight: FontWeight.w700,
              //                   size: size.width * 0.022,
              //                   color: Colors.green[600],
              //                   letterSpacing: 0.7),
              //             )
              //           ],
              //         ),
              //       ),
              //       Container(
              //         width: size.width,
              //         child: Row(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             SizedBox(
              //               width: size.width * 0.07,
              //             ),
              //             Container(
              //                 margin: EdgeInsets.all(
              //                   size.height * 0.01,
              //                 ),
              //                 height: size.height * 0.25,
              //                 width: size.width * 0.79,
              //                 decoration: BoxDecoration(
              //                   color: Colors.green,
              //                   image: DecorationImage(
              //                       image:
              //                           AssetImage("assets/images/skill1.png"),
              //                       fit: BoxFit.fill),
              //                 ),
              //                 child: Stack(
              //                   children: [
              //                     Positioned(
              //                       child: Container(
              //                           width: size.width * 0.9,
              //                           height: size.height * 0.27,
              //                           decoration: BoxDecoration(
              //                             color: Colors.transparent,
              //                           )),
              //                       top: size.height * 0.018,
              //                       left: size.width * 0.026,
              //                     ),
              //                   ],
              //                 )),
              //             Container(
              //                 height: size.height * 0.05,
              //                 width: size.width * 0.005,
              //                 child: Icon(
              //                   Icons.favorite,
              //                   color: Colors.red,
              //                   size: size.width * 0.07,
              //                 ))
              //           ],
              //         ),
              //       )
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    ));
  }
}
