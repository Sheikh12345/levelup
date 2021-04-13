import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:levelup/DataModel/camp_model.dart';
import 'package:levelup/DataModel/skill_model.dart';

class Server{
  Future<Skill> getDataFromServer({String url})async{
  try{
    // var url = 'https://pickleball-levelup.herokuapp.com/read/skill1';

    var response = await http.get(Uri.parse(url));
    print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    if(response.statusCode==200){
      var result = jsonDecode(response.body);

      return Skill.fromJson(result);
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
}