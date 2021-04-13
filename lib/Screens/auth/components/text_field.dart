import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:levelup/Style/appTextStyle.dart';



class TextFormFieldCustom extends StatelessWidget {
  final controller;
  final errorText;
  final hintText;
  final leftIcon;
  final onChanged;
  final obscureText;
  final rightIcon;
  const TextFormFieldCustom({Key key, this.controller, this.errorText, this.leftIcon, this.hintText, this.onChanged, this.obscureText=false, this.rightIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: size.width*0.9,
      height: size.height*0.07,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(size.width*0.02)
      ),
      child: TextField(
        autofocus: false,
        controller: controller,
        obscureText: obscureText,
        onChanged: onChanged,
        style: txtStylePop(color: Colors.black,
          size: size.height*0.021
        ),
        decoration: InputDecoration(
          prefixIcon: leftIcon,
          suffixIcon: rightIcon,
          errorText: errorText,
          hintText: hintText,
          hintStyle: txtStylePop(color: Colors.grey[600],
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
