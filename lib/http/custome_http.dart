import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:knotters/model/skills_model.dart';
import 'package:knotters/widget/extra.dart';
import 'package:knotters/widget/extra.dart';
import 'package:knotters/widget/extra.dart';
import 'package:knotters/widget/extra.dart';
import 'package:shared_preferences/shared_preferences.dart';

final String baseUrl = "https://knotter.learnwithmuhammadali.com/api/";
final String imageUrl = "https://learnwithmuhammadali.com/";

class CustomHttpRequest {
  static const Map<String, String> defaultHeader = {
    "Accept": "application/json",
  };
  static SharedPreferences? sharedPreferences;

  static Future<Map<String, String>> getHeaderWithToken() async {
    sharedPreferences = await SharedPreferences.getInstance();
    var header = {
      'Accept': 'application/json',
      "Authorization": "Bearer ${sharedPreferences!.getString('token')}",
    };
    print("user token is :${sharedPreferences!.getString('token')}");
    return header;
  }

  static Future<List<Animal>> fetchAllSkills() async {
    try {
      List<Animal> allSkills = [];
      var link = Uri.parse("${baseUrl}get-all-skills");
      var responce = await http.get(
        Uri.parse("$link"),
      );
      var data = jsonDecode(responce.body);
      //  print("All skills are :$data");
      Animal skillsModel;
      for (var i in data) {
        skillsModel = Animal.fromJson(i);
        allSkills.add(skillsModel);
      }
      return allSkills;
    } catch (e) {
      throw e.toString();
    }
  }
}
