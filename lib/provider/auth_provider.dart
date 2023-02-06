import 'dart:io';

import 'package:flutter/material.dart';
import 'package:knotters/widget/extra.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool xp = true;

class AuthProvider with ChangeNotifier {
  AppAccountType appAccountType = AppAccountType();
  bool _isStudent = true;
  String? _email;

  String _password = "";
  String _nationality = "";
  String _emirate = "";
  String _sex = "";
  String _firstName = "";
  String _lastName = "";
  String _phoneNumber = "";
  String _dateOfBirth = "";
  String _token = "";
  File? _profileImage;
  List<File> _documentList = [];
  String? _areYou,
      _universityName,
      _bankAccount,
      _emiratesIdNumber,
      _businessName,
      _estYear,
      _businessBasedIn;

  List<Animal> _selectedSkills = [];

  File? get getProfileImage => _profileImage;

  String? get getEmail => _email;
  String? get getToken => _token;

  String get getFirstName => _firstName;

  String get getLastName => _lastName;

  String get getPassword => _password;

  String get getNationality => _nationality;

  String get getEmirate => _emirate;
  String get getSex => _sex;

  bool get getAccountType => _isStudent;

  String get getPhoneNumber => _phoneNumber;

  String get getDateOfBirth => _dateOfBirth;

  List<Animal> get getSelectedSkills => _selectedSkills;

  List<File> get getDocumentList => _documentList;

  String? get getAreYou => _areYou;

  String? get getUniversityName => _universityName;

  String? get getBankAccount => _bankAccount;

  String? get getEmiratesIdNo => _emiratesIdNumber;

  String? get getBusinessName => _businessName;

  String? get getEstYear => _estYear;

  String? get getBusinessBasedIn => _businessBasedIn;

  set setAccountType(bool value) {
    _isStudent = value;
    appAccountType.setAccountType(value);
    notifyListeners();
  }

  set setBusinessName(String value) {
    _businessName = value;
    notifyListeners();
  }

  set setEstYear(String value) {
    _estYear = value;
    notifyListeners();
  }

  set setToken(String value) {
    _token = value;
    notifyListeners();
  }

  set setBusinessBasedIn(String value) {
    _businessBasedIn = value;
    notifyListeners();
  }

  set setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  set setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  set setNationality(String nationality) {
    _nationality = nationality;
    notifyListeners();
  }

  set setEmirate(String emirate) {
    _emirate = emirate;
    notifyListeners();
  } set setSex(String emirate) {
    _sex = emirate;
    notifyListeners();
  }

  set setProfileImage(File image) {
    _profileImage = image;
    notifyListeners();
  }

  set setLastName(String lastName) {
    _lastName = lastName;
    notifyListeners();
  }

  set setFirstName(String firstName) {
    _firstName = firstName;
    notifyListeners();
  }

  set setDateOfBirth(String dob) {
    _dateOfBirth = dob;
    notifyListeners();
  }

  set setPhoneNumber(String number) {
    _phoneNumber = number;
    notifyListeners();
  }

  set setSelectedSkilledList(List<Animal> animal) {
    _selectedSkills = animal;
    notifyListeners();
  }

  set setAreYou(String value) {
    _areYou = value;
    notifyListeners();
  }

  set setUniversityName(String value) {
    _universityName = value;
    notifyListeners();
  }

  set setBankAccount(String value) {
    _bankAccount = value;
    notifyListeners();
  }

  set setEmiratesIdNo(String value) {
    _emiratesIdNumber = value;
    notifyListeners();
  }

  set setDocumentList(List<File> images) {
    _documentList = images;
    notifyListeners();
    print("Document list length is ${images.length}");
  }
}

class AppAccountType {
  setAccountType(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(appAccountTypeToken, value);
  }

  Future<bool> getAccountType() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(
      appAccountTypeToken,
        ) ??
        false;
  }
}
  const String appAccountTypeToken = "appAccountType";

