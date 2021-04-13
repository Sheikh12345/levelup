import 'package:flutter/material.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';

class DuetView extends StatefulWidget {
  final String videoAddress;
  final jsonData;

  const DuetView({Key key, this.videoAddress, this.jsonData}) : super(key: key);
  @override
  _DuetViewState createState() => _DuetViewState();
}

class _DuetViewState extends State<DuetView> {
  String _serverUrl ="https://pickleball-levelup.herokuapp.com";


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Duet Videos",style: txtStylePop(color: Colors.white,weight: FontWeight.w500,
      ),),backgroundColor: primaryClr,
      centerTitle: true,),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width*0.015),
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ///Section one
              // Container(
              //   child: Row(
              //     children: [
              //       Column(
              //         mainAxisAlignment: MainAxisAlignment.start,
              //         children: [
              //    Container(
              //        margin: EdgeInsets.only(left: size.width*0.03,bottom: size.height*0.004,
              //            top: size.height*0.01
              //        ),
              //        width: size.width*0.45,
              //        child: Row(
              //          mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //          children: [
              //          Text("February 12, 2021",style: txtStyleCab(color: Colors.grey[800],
              //              size: size.width*0.02),),
              //            SizedBox(width: size.width*0.005,),
              //        ],),),
              //    Stack(children: [
              //      Container(
              //        width: size.width*0.48,
              //        height: size.height*0.16,
              //        color: Colors.grey,
              //        child: Row(
              //          crossAxisAlignment: CrossAxisAlignment.start,
              //          children: [
              //            Container(
              //              height: size.height*0.16,
              //              width: size.width*0.24,
              //              decoration: BoxDecoration(
              //                  image: DecorationImage(
              //                      image: AssetImage("assets/images/duet.png")
              //                  ),
              //                  border: Border(
              //                      top: BorderSide(
              //                          color: Colors.black,
              //                          width: size.width*.005
              //                      ),
              //                      left: BorderSide(
              //                          color: Colors.black,
              //                          width: size.width*.005
              //                      ),
              //                      bottom: BorderSide(
              //                          color: Colors.black,
              //                          width: size.width*.005
              //                      ),
              //                      right: BorderSide(
              //                          color: Colors.black,
              //                          width: size.width*.002
              //                      )
              //                  )
              //              ),
              //            ),
              //            Container(
              //              height: size.height*0.16,
              //              width: size.width*0.24,
              //              decoration: BoxDecoration(
              //                  image: DecorationImage(
              //                    image: AssetImage("assets/images/duet.png"),
              //
              //                  ),
              //                  border: Border(
              //                      top: BorderSide(
              //                          color: Colors.black,
              //                          width: size.width*.005
              //                      ),
              //                      left: BorderSide(
              //                          color: Colors.black,
              //                          width: size.width*.002
              //                      ),
              //                      bottom: BorderSide(
              //                          color: Colors.black,
              //                          width: size.width*.005
              //                      ),
              //                      right: BorderSide(
              //                          color: Colors.black,
              //                          width: size.width*.005
              //                      )
              //                  )
              //              ),
              //            ),
              //          ],
              //        ),
              //      ),
              //      Positioned(
              //           left: size.width*0.37,
              //          bottom: size.height*0.11,
              //          child: IconButton(
              //            icon:Icon( Icons.favorite,color: Colors.red,size: size.width*0.05,),
              //          ))
              //    ],),
              //  ],),
              //       Column(children: [
              //         ///title or date
              //         Container(
              //             margin: EdgeInsets.only(bottom: size.height*0.004,
              //                 top: size.height*0.01
              //             ),
              //             width: size.width*0.49,
              //             child: Row(children: [
              //               Text("February 12, 2021",style: txtStyleCab(color: Colors.grey[800],
              //                   size: size.width*0.02),),
              //               SizedBox(width: size.width*0.005,),
              //               SizedBox(width: size.width*0.001,)
              //             ],)),
              //         Stack(children: [
              //           Container(
              //             width: size.width*0.48,
              //             height: size.height*0.16,
              //             color: Colors.grey,
              //             child: Row(
              //               crossAxisAlignment: CrossAxisAlignment.start,
              //               children: [
              //                 Container(
              //                   height: size.height*0.16,
              //                   width: size.width*0.24,
              //                   decoration: BoxDecoration(
              //                       image: DecorationImage(
              //                           image: AssetImage("assets/images/duet.png")
              //                       ),
              //                       border: Border(
              //                           top: BorderSide(
              //                               color: Colors.black,
              //                               width: size.width*.005
              //                           ),
              //                           left: BorderSide(
              //                               color: Colors.black,
              //                               width: size.width*.005
              //                           ),
              //                           bottom: BorderSide(
              //                               color: Colors.black,
              //                               width: size.width*.005
              //                           ),
              //                           right: BorderSide(
              //                               color: Colors.black,
              //                               width: size.width*.002
              //                           )
              //                       )
              //                   ),
              //                 ),
              //                 Container(
              //                   height: size.height*0.16,
              //                   width: size.width*0.24,
              //                   decoration: BoxDecoration(
              //                       image: DecorationImage(
              //                         image: AssetImage("assets/images/duet.png"),
              //
              //                       ),
              //                       border: Border(
              //                           top: BorderSide(
              //                               color: Colors.black,
              //                               width: size.width*.005
              //                           ),
              //                           left: BorderSide(
              //                               color: Colors.black,
              //                               width: size.width*.002
              //                           ),
              //                           bottom: BorderSide(
              //                               color: Colors.black,
              //                               width: size.width*.005
              //                           ),
              //                           right: BorderSide(
              //                               color: Colors.black,
              //                               width: size.width*.005
              //                           )
              //                       )
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //           Positioned(
              //               left: size.width*0.37,
              //               bottom: size.height*0.11,
              //               child: IconButton(
              //                 icon:Icon( Icons.favorite,color: Colors.red,size: size.width*0.05,),
              //               ))
              //         ],),
              //       ],),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: size.height*0.01,
              // ),







              
            ],
          ),
        ),
      ),
    ));
  }
}
