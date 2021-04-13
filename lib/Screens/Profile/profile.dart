import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:levelup/Screens/auth/sign_in.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/common/common.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        backgroundColor: primaryClr,
        title: Text("Profile",style: txtStyleCab(color: Colors.white,size: size.width*0.055,),),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.logout,color: Colors.white,), onPressed:(){
            FirebaseAuth.instance.signOut().whenComplete((){
              screenPushRep(context, SignIn());
            });
          })
        ],
      ),
      body: Column(
        children: [
          Container()
        ],
      ),
    ));
  }
}
