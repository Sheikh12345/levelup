import 'package:flutter/material.dart';
import 'package:levelup/Services/database-server/server.dart';
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
       child: FutureBuilder(
         future: Server().getStoreItemsFromServer(),
         builder: (_,snapshot){
           if(snapshot.hasData){
             return ListView.builder(
                 itemCount: snapshot.data.data.length,
                 itemBuilder: (_,index){
                return Container(
                 height: size.height * 0.28,
                 width: size.width * 0.95,
                 margin: EdgeInsets.symmetric(vertical: size.height*0.01,horizontal: size.width*0.025),
                 child: Stack(
                   children: [
                     Container(
                       height: size.height * 0.28,
                       width: size.width * 0.95,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         image: DecorationImage(
                             image: NetworkImage(
                                 "https://pickleball-levelup.herokuapp.com/store/getstoreicon/${snapshot.data.data[index].pic}"),
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
                         left: size.width * 0.3,
                         child: Container(
                           alignment: Alignment.center,
                          width: size.width*0.6,
                           child: Text(
                             "${snapshot.data.data[index].title}",
                             style: txtStylePop(
                                 size: size.width * 0.08,
                                 weight: FontWeight.w600,
                                 color: Colors.white),
                           ),
                         )),
                     Positioned(
                         top: size.height * 0.08,
                         left: size.width * 0.2,
                         child: Container(
                           alignment: Alignment.center,
                           width: size.width*0.75,
                           child: Text(
                             "${snapshot.data.data[index].description}",
                             style: txtStylePop(
                                 size: size.width * 0.03,
                                 weight: FontWeight.w600,
                                 color: Colors.white),
                           ),
                         )),
                     Positioned(
                         top: size.height * 0.22,
                         left: size.width * 0.28,
                         child: Container(
                           height: size.height * 0.035,
                           child: MaterialButton(
                             elevation: 10,
                             color: Colors.white,
                             shape: OutlineInputBorder(
                                 borderRadius: BorderRadius.circular(20)),
                             child: Text(
                               "SHOP FOR ${snapshot.data.data[index].title.toString().substring(0,1).toUpperCase()}${snapshot.data.data[index].title.toString().substring(1)}",
                               style: txtStylePop(
                                   color: Colors.black,
                                   weight: FontWeight.w600),
                             ),
                             onPressed: () {
                               _launchURL(
                                   "${snapshot.data.data[index].url}");
                             },
                             splashColor: primaryClr,
                           ),
                         ))
                   ],
                 ),
               );
             });
           }else{
             return  Center(child: Container(
               margin: EdgeInsets.only(top: size.height*0.32),
               height: size.height*0.8,
               child: Column(
                 children: [
                   Container(
                       width: size.width*0.5,
                       child: Image.asset("assets/images/icon.png")),
                   SizedBox(
                     height: size.height*0.28,
                   ),
                   CircularProgressIndicator()
                 ],
               ),
             ));
           }
         },
       ),
      ),
    ));
  }

  void _launchURL(String _url) async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}
