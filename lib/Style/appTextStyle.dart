
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

txtStyleCab({var weight, var size,var color,var letterSpacing}){
  return GoogleFonts.cabin(textStyle: TextStyle(fontSize: size,fontWeight: weight,color: color??Colors.black,letterSpacing: 0.9));
}
txtStylePop({var weight, var size,var color,var letterSpacing}){
  return GoogleFonts.poppins(fontWeight: weight,fontSize: size,color: color??Colors.black,letterSpacing: letterSpacing);
}