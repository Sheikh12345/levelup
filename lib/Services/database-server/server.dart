import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:levelup/DataModel/camp_model.dart';
import 'package:levelup/DataModel/ild.dart';
import 'package:levelup/DataModel/ild_lesson_model.dart';
import 'package:levelup/DataModel/skill_model.dart';

class Server{
  Future<Skill> getDataSkill({String url})async{
  try{

    var response = await http.get(Uri.parse("$url"));
    print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body.toString()}');
    if(response.statusCode==200){
      var result = jsonDecode(response.body);
         // print(AllSkill.fromJson(result).skill1.success);
      return Skill.fromJson(result);
    }
  }catch(e){
   print("error => "+e.toString());
  }
  }

  Future<AllSkill> getDataFromServer1({String url})async{
    try{

      var response = await http.get(Uri.parse("https://pickleball-levelup.herokuapp.com/read/allskills"));
      print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body.toString()}');
      if(response.statusCode==200){
        var result = jsonDecode(response.body);

        return AllSkill.fromJson(result);
      }
    }catch(e){
      print("error => "+e.toString());
    }
  }

  Future<CampModel> getCampDetailFromServer(String month)async{
    try{
      String url = 'https://pickleball-levelup.herokuapp.com/camps/get${month}camps';

      var response = await http.get(Uri.parse(url));
      print(response.statusCode);
        var result =   jsonDecode(response.body);
        return CampModel.fromJson(result);
    }catch(e){

    }
  }

  Future<Ild> getIldDataFromServer()async{
    try{
      String url = "https://pickleball-levelup.herokuapp.com/read/ild";

      var response = await http.get(Uri.parse(url));
      print(response.statusCode);
      var result =   jsonDecode(response.body);
      return Ild.fromJson(result);
    }catch(e){
    }
  }

  Future<Lesson> getIldLessonFromServer(String lessonName)async{
    try{
      String url = "https://pickleball-levelup.herokuapp.com/read/ild/$lessonName";

      var response = await http.get(Uri.parse(url));
      print("$lessonName "+response.statusCode.toString());
      var result =   jsonDecode(response.body);
      return Lesson.fromJson(result);
    }catch(e){
    }
  }
}