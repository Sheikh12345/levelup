import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:levelup/Style/appColor.dart';
import 'package:levelup/Style/appText.dart';
import 'package:levelup/Style/appTextStyle.dart';
import 'package:levelup/services/authentication.dart';
import 'package:toast/toast.dart';

import 'components/text_field.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _controllerEmail = TextEditingController();
  String _errorText;
  var icon;
  @override
  void initState() {
    super.initState();
    icon = Icon(Icons.cancel_outlined,color: Colors.white,);
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(child: Scaffold(
    body: Container(
      width: size.width,
      height: size.height,
      child: SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
         Padding(padding: EdgeInsets.only(top: size.height*0.15),
         child: Hero(
           tag: "forget",
           child: Text("Forget Password",style: txtStyleCab(weight: FontWeight.bold,
           size: size.width*0.07,color: Colors.black),),
         ),),

            Padding(padding: EdgeInsets.only(top: size.height*0.04,left: size.width*0.07,right: size.width*0.07,bottom: size.height*0.03),
              child: Text("$forgetMsgTxt",style: txtStyleCab(weight: FontWeight.bold,
                  size: size.width*0.032,color: Colors.black),),),
            TextFormFieldCustom(
              hintText: "Email",
              leftIcon: Icon(Icons.email),
              controller: _controllerEmail,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),


            RaisedButton(
              onPressed: () {
                _sendResetPasswordEmail();
              },
              color: primaryClr,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(size.width * 0.1)),
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.35, vertical: size.height * 0.02),
              child: Text(
                "SEND",
                style: txtStyleCab(color: Colors.white, size: size.width * 0.038),
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
            ),

        ],),
      ),
    ),
    ));
  }

  _checkEmailIsValid(){
    if(!EmailValidator.validate(_controllerEmail.text)){
      setState(() {
        _errorText = "Email is not valid";
        icon = Icon(Icons.cancel_outlined,color: Colors.red,);
      });
    }else{
      setState(() {
        _errorText = null;
        icon = Icon(Icons.check,color: Colors.green,);
      });
    }
  }

  _sendResetPasswordEmail(){
    if(_errorText==null && _controllerEmail.text.toString().length>5){
      FirebaseAuthentication.passwordReset(_controllerEmail.text.toString(), context).whenComplete((){
        Navigator.pop(context);
      });
    }else{
      Toast.show("Please enter email here", context,duration: 1,gravity: 1);
    }
  }
}
