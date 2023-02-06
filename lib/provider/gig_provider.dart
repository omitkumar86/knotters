

import 'package:flutter/material.dart';
import 'package:knotters/http/gig_http.dart';
import 'package:knotters/model/sme_gig_model.dart';
import 'package:knotters/model/student_gig_model.dart';

class GigProvider with ChangeNotifier{
  List<SmeGigModel> allSmeGigList=[];
  List<Data> allStudentGigList=[];


  Future<List<SmeGigModel>> getAllSmeGig( )async{
    allSmeGigList =await GigHttpRequest.fetchAllSmeGig();
    notifyListeners();
    return allSmeGigList;
  }

  Future<List<Data>> getAllStudentGig(String pageNo)async{
    allStudentGigList = await GigHttpRequest.fetchAllStudentGig(pageNo);
    notifyListeners();
    return allStudentGigList;
  }









}
