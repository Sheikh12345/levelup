import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:levelup/Screens/Home/home.dart';
import 'package:levelup/Screens/auth/sign_up.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/common/common.dart';
import 'package:levelup/services/authentication.dart';
import 'package:toast/toast.dart';

import 'components/text_field.dart';
import 'forget_password.dart';


class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();

  bool _checkValue = false;
  bool _passIsVisible;

  @override
  void initState() {
    super.initState();
    _passIsVisible = true;
  }

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xfffcfcfc),
      statusBarBrightness: Brightness.dark,
    ));
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          alignment: Alignment.center,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.9,
                height: size.height * 0.12,
                margin: EdgeInsets.only(bottom: size.height * 0.05),
                child: Image.asset("assets/images/icon.png"),
              ),
              TextFormFieldCustom(
                hintText: "Email",
                leftIcon: Icon(Icons.email),
                controller: _controllerEmail,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextFormFieldCustom(
                hintText: "Password",
                leftIcon: Icon(Icons.vpn_key_rounded),
                controller: _controllerPassword,
                obscureText:_passIsVisible ,
                rightIcon: IconButton(icon: Icon(_passIsVisible
                    ? Icons.visibility_off
                    : Icons.remove_red_eye),onPressed: (){
                  setState(() {
                    _passIsVisible=!_passIsVisible;

                  });
                },),
              ),
              Container(
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: _checkValue,
                            onChanged: (value) {
                              setState(() {
                                _checkValue = value;
                              });
                            }),
                        Text(
                          "Remember me",
                          style: txtStylePop(
                              color: Colors.black, size: size.width * 0.032),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        screenPush(context, ForgetPassword());
                      },
                      child: Text(
                        "Forget Password",
                        style: txtStyleCab(
                            color: Color(0xFFFF498749),
                            size: size.width * 0.032,
                            weight: FontWeight.w600,
                            letterSpacing: 0.9),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RaisedButton(
                elevation: 5,
                color: primaryClr,
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.38,
                    vertical: size.height * 0.015),
                onPressed: () {
                  _signIn();
                },
                child: Text(
                  "LOGIN",
                  style: txtStyleCab(
                      color: Colors.white,
                      size: size.height * 0.023,
                      weight: FontWeight.w500,
                      letterSpacing: 1),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: size.height * 0.01),
                width: size.width * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: txtStylePop(
                          color: Colors.grey[800], size: size.height * 0.018),
                    ),
                    InkWell(
                      onTap: () {
                        screenPush(context, SignUp());
                      },
                      child: Text(
                        " Sign Up here",
                        style: txtStylePop(
                            color: Color(0xFFFF498749),
                            size: size.height * 0.018,
                            weight: FontWeight.w600,
                            letterSpacing: 1.0),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
            ],
          ),
        ),
      ),
    ));
  }

  _signIn(){
    if(EmailValidator.validate(_controllerEmail.text)){
      if(_controllerPassword.text.length<5){
        Toast.show("Password length is short", context,gravity:1);
      }else{
         FirebaseAuthentication.signInWithEmailAndPass(_controllerEmail.text, _controllerPassword.text, context).then((value){
           if(value.emailVerified){
             screenPushRep(context, Home());
             Toast.show("Welcome back", context,gravity: 1,backgroundColor: primaryClr,textColor: Colors.black);
           }else{
             Toast.show("Please verify your email first", context,gravity: 1);
           }
         });
      }
    }else{
      if(_controllerEmail.text.isEmpty){
        Toast.show("Email is empty", context,gravity: 1);
      }else{
        Toast.show("Email is not valid", context,gravity: 1);
      }
    }
  }
}
