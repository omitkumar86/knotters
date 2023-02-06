import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart'as http;
import 'package:knotters/http/custome_http.dart';
import 'package:knotters/model/sme_gig_model.dart';
import 'package:knotters/model/student_gig_model.dart';
class GigHttpRequest{

  static Future<List<SmeGigModel>> fetchAllSmeGig() async {
    try {
      List<SmeGigModel> allSmeGig = [];
      var link =
      Uri.parse("${baseUrl}client/job-post-list");
      var responce = await http.get(
        Uri.parse("$link"),headers: await CustomHttpRequest.getHeaderWithToken(),
      );
      var data = jsonDecode(responce.body);
      debugPrint("All sme gigs areeeeeeer $data");
      SmeGigModel gigModel;
      for (var i in data) {
        gigModel = SmeGigModel.fromJson(i);
        allSmeGig.add(gigModel);
      }
      return allSmeGig;
    } catch (e) {
      print("problem is $e");
      throw e.toString();
    }
  }
  static Future<List<Data>> fetchAllStudentGig(String pageNo) async {
    try {
      List<Data> allStudentGig = [];
      var link =
      Uri.parse("${baseUrl}freelancer/browse-all-gigs?page=$pageNo");
      var responce = await http.get(
        Uri.parse("$link"),headers: await CustomHttpRequest.getHeaderWithToken(),
      );
      var data = jsonDecode(responce.body);
      debugPrint("All Student gigs areeeeeee $data");
      Data gigModel;
      for (var i in data["data"]) {
        gigModel = Data.fromJson(i);
        allStudentGig.add(gigModel);
      }
      return allStudentGig;
    } catch (e) {
      throw e.toString();
    }
  }


}