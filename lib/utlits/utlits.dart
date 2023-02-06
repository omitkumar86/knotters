import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:provider/provider.dart';


void showSnackBar(
    {required BuildContext context, required String content}) async {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}


Future<File?> pickImageFromGallery( BuildContext context,  ImageSource src) async {
  File? image;
  try {
    final pickedImage =
    await ImagePicker().pickImage(source: src);

    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    showSnackBar(context: context, content: e.toString());
  }
  return image;
}

class Utils {
  BuildContext context;
  Utils(this.context);

  Size get getScreenSize => MediaQuery.of(context).size;
  bool get getTheme => Provider.of<AuthProvider>(context).getAccountType;
  Color get getColor => getTheme ? Colors.white : Colors.black;


  Color get baseShimmerColor =>
      getTheme ? Colors.grey.shade500 : Colors.grey.shade200;

  Color get highlightShimmerColor =>
      getTheme ? Colors.grey.shade700 : Colors.grey.shade400;

  Color get widgetShimmerColor =>
      getTheme ? Colors.grey.shade600 : Colors.grey.shade100;
}
