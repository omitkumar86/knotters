import 'package:flutter/material.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/const.dart';

class Animal {
    int? id;
    String ?skillName;

  Animal({
    this.id,
    this.skillName,
  });
  Animal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    skillName = json['skill_name'];
  }

}
