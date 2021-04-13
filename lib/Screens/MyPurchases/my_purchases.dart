import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levelup/Screens/MyPurchases/video_overviedw.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/common/common.dart';

class MyPurchases extends StatefulWidget {
  @override
  _MyPurchasesState createState() => _MyPurchasesState();
}

class _MyPurchasesState extends State<MyPurchases> {

  String _serverUrl ="https://pickleball-levelup.herokuapp.com";
  @override
  void initState(){
    super.initState();
    getLength();
  }
  QuerySnapshot querySnapshot;

  getLength()async{

    querySnapshot =
    await FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser.uid).collection("purchaseCourses").get();
  setState(() {});
  }
  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser.uid).collection("purchaseCourses").snapshots(),
          builder: (_,snapshot){
            if(snapshot.hasData){
              return ListView.builder(
                  itemCount: querySnapshot.docs.length==null?0:querySnapshot.docs.length,
                  itemBuilder:(_,index){
                    var data = snapshot.data.docs[index];
                   return  Container(
                        margin: EdgeInsets.all( size.height * 0.01,
                        ),
                        height: size.height * 0.3,
                        width: size.width * 0.95,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          image: DecorationImage(
                              image: NetworkImage("$_serverUrl${data["address"]}/${data["thumbnail"][0]}"),
                              fit: BoxFit.fill),
                        ),
                        child: GestureDetector(
                          onTap: (){
                            screenPush(context, VideoOverview(jsonData: data,));
                          },
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
                                  width: size.width*0.7,
                                  child: RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: "${data["title"]}",
                                        style: txtStyleCab(
                                            color: Colors.white,
                                            size: size.width * 0.08,
                                            weight: FontWeight.w900),
                                      ),
                                    ]),
                                  ),
                                ),
                                top: size.height * 0.07,
                                left: size.width * 0.25,
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
                          ),
                        ));

              });
            }else{
              return Center(child: Text("Not Available"),);
            }
          },
        ),
      ),
    );
  }
}
