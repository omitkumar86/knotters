import 'package:flutter/material.dart';
import 'package:knotters/http/student_profile_http.dart';
import 'package:knotters/model/student_profile_model.dart';

class StudentProfileProvider with ChangeNotifier {
  List<StudentProfileModel> studentProfileList = [];

  getStudentProfileData() async {
    studentProfileList = await StudentProfileHttpRequest.fetchStudentProfileData();
    notifyListeners();
  }
}