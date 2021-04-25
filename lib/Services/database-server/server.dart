import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:levelup/DataModel/camp_model.dart';
import 'package:levelup/DataModel/dgf_model.dart';
import 'package:levelup/DataModel/all_ild_model.dart';
import 'package:levelup/DataModel/ild_model.dart';
import 'package:levelup/DataModel/skill_model.dart';
import 'package:levelup/DataModel/store_model.dart';

class Server{
  Future<Skill> getSkillData({String url})async{
    try{

      var response = await http.get(Uri.parse("$url"));
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

  Future<IldModel> getIldData({String url})async{
    try{

      var response = await http.get(Uri.parse("$url"));
      // print('Response body: ${response.body.toString()}');
      if(response.statusCode==200){
        var result = jsonDecode(response.body);
        // print(AllSkill.fromJson(result).skill1.success);
        return IldModel.fromJson(result);
      }
    }catch(e){
      print("error => "+e.toString());
    }
  }


  Future<AllSkill> getSkillDataFromServer1()async{
    try{
      var response = await http.get(Uri.parse("https://pickleball-levelup.herokuapp.com/read/allskills"));
      // print('Response body: ${response.body.toString()}');
      if(response.statusCode==200){
        var result = jsonDecode(response.body);
        return AllSkill.fromJson(result);
      }
    }catch(e){
      print("skill error => "+e.toString());
    }
  }

  Future<CampModel> getCampDetailFromServer(String month)async{
    try{
      String url = 'https://pickleball-levelup.herokuapp.com/camps/get${month}camps';

      var response = await http.get(Uri.parse(url));
      var result =   jsonDecode(response.body);
      return CampModel.fromJson(result);
    }catch(e){
 print("camp error => ${e.toString()}");
    }
  }

  Future<AllLids> getIldDataFromServer()async{
    try{
      // for(int i=0;i<20;i++){
      //   print(i.toString());
      // }
      var response = await http.get(Uri.parse("https://pickleball-levelup.herokuapp.com/read/allilds"));
      return AllLids.fromJson(jsonDecode(response.body));
    }catch(e){
      print("ILDS Error => "+e.toString());
    }
  }

  Future<AllDgfs> getDgfDataFromServer()async{
    try{
      var response = await http.get(Uri.parse("https://pickleball-levelup.herokuapp.com/read/alldgfs"));
      return AllDgfs.fromJson(jsonDecode(response.body));
    }catch(e){
      print("DGF Error => "+e.toString());
    }
  }
  Future<StoreModel> getStoreItemsFromServer()async{
    try{
      var response = await http.get(Uri.parse("https://pickleball-levelup.herokuapp.com/store/getstores"));
      return (StoreModel.fromJson(jsonDecode(response.body)));

    }catch(e){
      print("store error => "+e.toString());
    }
  }

}