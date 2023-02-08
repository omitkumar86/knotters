import 'dart:convert';

import 'package:knotters/http/custome_http.dart';
import 'package:http/http.dart' as http;
import 'package:knotters/model/student_profile_model.dart';

class StudentProfileHttpRequest{
  static Future<List<StudentProfileModel>> fetchStudentProfileData() async {
    try {
      List<StudentProfileModel> studentProfileList = [];
      StudentProfileModel studentProfileModel;
      String urlLink = "${baseUrl}view-profile-info";
      var responce = await http.get(
        Uri.parse(urlLink),
        headers: await CustomHttpRequest.getHeaderWithToken(),
      );
      var data = jsonDecode(responce.body.toString());
      print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbb ${responce.body}");
      for (var i in data) {
        studentProfileModel = StudentProfileModel.fromJson(i);
        studentProfileList.add(studentProfileModel);
      }
      print("Name is -----------------${studentProfileList}");
      return studentProfileList;
    }
    catch (e) {
      print("problem is $e");
      throw e.toString();
    }
  }
}