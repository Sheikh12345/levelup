import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:levelup/Screens/auth/sign_in.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/common/common.dart';
import 'package:levelup/services/authentication.dart';
import 'package:toast/toast.dart';

import 'components/text_field.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPassword = TextEditingController();
  TextEditingController _controllerName = TextEditingController();
  FirebaseFirestore _firesUser = FirebaseFirestore.instance;
  List<dynamic> cards = [];
  List<String> courses = [];
  bool passIsVisible;
  QuerySnapshot querySnapshot;
  @override
  void initState() {
    super.initState();
    setState(() {
      passIsVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
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
                  hintText: "Full Name",
                  leftIcon: Icon(Icons.person),
                  controller: _controllerName,
                ),
                SizedBox(
                  height: size.height * 0.02,
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
                  obscureText: passIsVisible,
                  rightIcon: IconButton(
                    icon: Icon(passIsVisible
                        ? Icons.visibility_off
                        : Icons.remove_red_eye),
                    onPressed: () {
                      setState(() {
                        passIsVisible = !passIsVisible;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.03,
                ),
                RaisedButton(
                  elevation: 5,
                  color: primaryClr,
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.37,
                      vertical: size.height * 0.015),
                  onPressed: () {
                    singUp();
                  },
                  child: Text(
                    "SIGNUP",
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
                        "Already have an account? ",
                        style: txtStylePop(
                            color: Colors.grey[800], size: size.height * 0.018),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          " Sign In",
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
      ),
    );
  }

  singUp() {

    if (_controllerName.text.length < 2) {
      Toast.show("Name is short", context, gravity: 1);
    } else {
      if (EmailValidator.validate(_controllerEmail.text)) {
        if (_controllerPassword.text.length < 5) {
          Toast.show("Password length is short", context, gravity: 1);
        } else {
          FirebaseAuthentication.signUpWithEmailAndPass(
                  _controllerEmail.text, _controllerPassword.text, context)
              .then((value) {
            if (value != null) {
              _firesUser
                  .collection("Users")
                  .doc(FirebaseAuth.instance.currentUser.uid)
                  .set({
                "Cards": FieldValue.arrayUnion(cards),
                "name": _controllerName.text.toString(),
                "likedVideosList":[],
                "CourseIsAvailable":false
              }).whenComplete(() {
                _firesUser
                    .collection("Users")
                    .doc(FirebaseAuth.instance.currentUser.uid)
                    .update({
                  "listCourses": FieldValue.arrayUnion(courses)
                }).whenComplete(() {
                });
              });

              Toast.show("Verify your email", context, gravity: 1, duration: 2);

              screenPushRep(context, SignIn());
            }
          });
        }
      } else {
        Toast.show("Email is not valid", context, gravity: 1);
      }
    }
  }

}
