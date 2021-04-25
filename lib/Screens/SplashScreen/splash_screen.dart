import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:levelup/Screens/Home/home.dart';
import 'package:levelup/Screens/auth/sign_in.dart';
import 'package:levelup/Services/StripePayment/stripe_service.dart';
import 'package:levelup/Services/database-server/server.dart';
import 'package:levelup/common/common.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xfffcfcfc),
      statusBarBrightness: Brightness.dark,
    ));
    Size size = MediaQuery.of(context).size;
    Future.delayed(Duration(seconds: 4), () {
      screenPushRep(context, changeScreen());
    });
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: size.height * 0.1),
                height: size.height * 0.2,
                width: size.width * 0.9,
                child: Image.asset("assets/images/icon.png"),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height*0.02),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(children: [
                    TextSpan(
                        text: "\"The World's #1 Training\nApp for Pickleball\"\n\n",
                        style: GoogleFonts.pathwayGothicOne(
                            fontSize: size.width * 0.07,
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.8)),
                    TextSpan(
                        text: "- Pickleball Magazine",
                        style: GoogleFonts.cabin(
                            fontSize: size.width * 0.04,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.9))
                  ]),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: size.height * 0.06),
                child: CircularProgressIndicator(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget changeScreen() {
  try{
    if(FirebaseAuth.instance.currentUser.uid.length!=null){
      return Home();
    }else{
      return SignIn();
    }
  }catch(e){
    print("error =>${e.toString()}");
  }
  return SignIn();
  }
}
