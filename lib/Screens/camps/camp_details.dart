import 'package:flutter/material.dart';
import 'package:levelup/DataModel/camp_model.dart';
import 'package:levelup/Services/database-server/server.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';

class CampDetails extends StatefulWidget {
 final String campMonth;

  const CampDetails({Key key, this.campMonth}) : super(key: key);
  @override
  _CampDetailsState createState() => _CampDetailsState();
}

class _CampDetailsState extends State<CampDetails> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text("Details",style: txtStylePop(color: Colors.white,weight: FontWeight.w500,
      ),),backgroundColor: primaryClr,
        centerTitle: true,),
      body: Container(
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.17,
                width: size.width * 0.5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/icon.png")
                    )
                ),
              ),
              Container(
                height: size.height*0.03,
                width: size.width,
                color: Colors.grey[600],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: size.width*0.06),
                      height: size.height*0.045,
                        width: size.width*0.14,
                      child:Text("Pro",style: txtStylePop(
                          color: Colors.white,
                          weight: FontWeight.w500,
                          size: size.width*0.032
                      ),
                      )),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.width*0.06),
                        margin: EdgeInsets.only(right:size.width*0.01),
                        height: size.height*0.045,
                        width: size.width/5,
                        child:Text("Camp",style: txtStylePop(
                            color: Colors.white,
                            weight: FontWeight.w500,
                            size: size.width*0.032
                        ),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.width*0.02),
                        height: size.height*0.045,
                        width: size.width/5,
                        child:Text("Date",style: txtStylePop(
                            color: Colors.white,
                            weight: FontWeight.w500,
                            size: size.width*0.032
                        ),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: size.width*0.029),
                        height: size.height*0.045,
                        width: size.width/5,
                        child:Text("Price",style: txtStylePop(
                            color: Colors.white,
                            weight: FontWeight.w500,
                            size: size.width*0.032
                        ),
                        )),
                    Container(
                        alignment: Alignment.centerLeft,
                        height: size.height*0.045,
                        width: size.width/5,
                        child:Text("Available",style: txtStylePop(
                            color: Colors.white,
                            weight: FontWeight.w500,
                            size: size.width*0.032
                        ),
                        )),
                  ],
                ),
              ),
              FutureBuilder(
                future: Server().getCampDetailFromServer(widget.campMonth),
                builder: (_,snapshot){
                  if(snapshot.connectionState== ConnectionState.waiting){
                    return Container(
                        width: size.width,
                        height: size.height*0.6,
                        child: Center(child: CircularProgressIndicator()));
                  }
                  if(snapshot.hasData){
                    printData("length "+snapshot.data.data.length.toString());
                    return   Container(
                      height: size.height*0.6,
                      width: size.width,
                      child: ListView.builder(
                          itemCount: snapshot.data.data.length??0,
                          itemBuilder: (_,index){
                        return Container(
                          height: size.height*0.06,
                          width: size.width,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: size.width*0.01,right: size.width*0.01,
                                    bottom: size.height*0.005,
                                    top: size.height*0.005),
                                width: size.width*0.14,
                                decoration: BoxDecoration(

                                ),
                                constraints: BoxConstraints(
                                    minHeight: size.height*0.06
                                ),
                                child: Image.asset("assets/images/title1.png",fit: BoxFit.fill,),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.only(left: size.width*0.06),
                                margin: EdgeInsets.only(right:size.width*0.02),
                                height: size.height*0.045,
                                width: size.width/5,
                                child:Text("${snapshot.data.data[index].camp}",style: txtStylePop(
                                    color: Colors.black,
                                    weight: FontWeight.w500,
                                    size: size.width*0.026
                                ),
                                ),
                              ),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: size.width*0.02),
                                  height: size.height*0.045,
                                  width: size.width/5,
                                  child:Text("${snapshot.data.data[index].date}",style: txtStylePop(
                                      color: Colors.black,
                                      weight: FontWeight.w500,
                                      size: size.width*0.026
                                  ),
                                  )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(left: size.width*0.029),
                                  height: size.height*0.045,
                                  width: size.width/5,
                                  child:Text("\$${snapshot.data.data[index].price}",style: txtStylePop(
                                      color: Colors.black,
                                      weight: FontWeight.w500,
                                      size: size.width*0.026
                                  ),
                                  )),
                              Container(
                                  alignment: Alignment.centerLeft,
                                  height: size.height*0.045,
                                  width: size.width/5,
                                  child:Text("${snapshot.data.data[index].level}",style: txtStylePop(
                                      color: Colors.black,
                                      weight: FontWeight.w500,
                                      size: size.width*0.026
                                  ),
                                  )),
                            ],
                          ),
                        );
                      }),
                    );
                  }else{
                    return Center(child: Text("Network Problem"),);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  void printData(data) {
    print(data);
  }
}
