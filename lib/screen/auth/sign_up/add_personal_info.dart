import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/screen/auth/sign_up/add_auth_info2.dart';
import 'package:knotters/screen/auth/sign_up/add_education.dart';
import 'package:knotters/screen/auth/sign_up/add_skills.dart';
import 'package:knotters/screen/auth/sign_up/create_email_password.dart';
import 'package:knotters/utlits/utlits.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';

import 'package:knotters/widget/custom_TextField.dart';
import 'package:provider/provider.dart';
class AddPersonalInfo extends StatefulWidget {

  static const String id = 'AddPersonalInfo';

  @override
  State<AddPersonalInfo> createState() => _AddPersonalInfoState();
}

class _AddPersonalInfoState extends State<AddPersonalInfo> {
//  const AddPersonalInfo({Key? key}) : super(key: key);
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();

  FocusNode phoneNumberFocusNode=FocusNode();
  FocusNode firstNameFocusNode=FocusNode();
  FocusNode lastNameFocusNode=FocusNode();
  String ?sexValue;
  File? image;
  void selectImage( ImageSource src) async {
    image = await pickImageFromGallery(context,src);
    setState(() {

      Provider.of<AuthProvider>(context,listen: false).setProfileImage=image!;
    });
    print("Done     ${Provider.of<AuthProvider>(context,listen: false).getProfileImage}");
  }
  List<String> sexList = <String>['Male',"Female"];


  @override
  void dispose() {
    // TODO: implement dispose
    phoneNumberController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
 
        body: Container(
          width: double.infinity,

          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppbarButton(onTap: () {
                    Navigator.of(context).pop();
                  }),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "PERSONAL INFORMATION",
                    style: myStyleHeader(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    child: Text(
                      "Depending on your selection we will show you our services",
                      style: myStyleBody(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Stack(
                    children: [
                      image == null
                          ? const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://png.pngitem.com/pimgs/s/649-6490124_katie-notopoulos-katienotopoulos-i-write-about-tech-round.png',
                        ),
                        radius: 64,
                      )
                          : CircleAvatar(
                        backgroundImage: FileImage(
                          image!,
                        ),
                        radius: 64,
                      ),
                      Positioned(
                        right: -20,bottom: -5,
                        child: MaterialButton(
                          onPressed: (){
                            showOptionDialog(context);
                            //selectImage(ImageSource.gallery);
                          },
                          child:  CircleAvatar(
                            backgroundColor: primaryColor,
                            child: Icon(Icons.edit,size: 12,color: Colors.white,),
                            maxRadius: 12,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30,),

                  CustomeTextField2(
                      textInputAction: TextInputAction.next,
                      focusNode:firstNameFocusNode,
                    validator:  (  value){
                      if(value==null){
                        return "First Name required";
                      }
                      if(value.length <3){
                        return "First Name too short";
                      }
                    },
                    controller: firstNameController,
                    hintText: "First Name",

                  ),
                  SizedBox(height:12,),
                  CustomeTextField2(
                      textInputAction: TextInputAction.next,
                      focusNode:lastNameFocusNode,
                    validator: (val){},
                    controller: lastNameController,
                    hintText: "Last Name",
                    prefixIcon: Icon(Icons.drive_file_rename_outline,color: primaryColor,size: 14,),
                  ),
                  SizedBox(height:12,),
                  CustomeTextField2(
                      textInputAction: TextInputAction.done,
                      focusNode:phoneNumberFocusNode,
                    validator:  (  value){
                      if(value==null){
                        return "Phone Number required";
                      }
                      if(value.length <3){
                        return "Phone Number too short";
                      }
                    },
                    controller: phoneNumberController,
                    hintText: "Phone Number",
                    prefixIcon: Icon(Icons.call,color: primaryColor,size: 14,),
                  ),
                  SizedBox(height:12,),
                  CustomeDropDownButton(
                    validator: ( val){
                      /*if(val==null){
                        return "Sex is Required";
                      }*/
                    },
                    onChange:  ( value)async {
                      // This is called when the user selects an item.
                      setState(() {
                        sexValue = value!;
                      });
                      authProvider.setSex=value;
                      print("xxxx${authProvider.getSex}");
                      print("cccc${authProvider.getNationality}");
                    },
                    title: "Sex",
                    dropdownList: sexList,
                    dropdownValue: sexValue,
                  ),
                  SizedBox(height:12,),
                  InkWell(
                    onTap: (){
                      showCupertinoModalPopup(
                        context: context,
                        builder: (_) => Container(

                          decoration: BoxDecoration(

                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                topLeft: Radius.circular(10.0)),
                            color: Colors.white,
                          ),
                          height: 200,
                          child: CupertinoDatePicker(
                              initialDateTime: DateTime.now(),
                              maximumYear: DateTime.now().year,
                              minimumYear: 1900,
                              // mode: CupertinoDatePickerMode.date,
                              mode:CupertinoDatePickerMode.date,
                              use24hFormat: false,

                              onDateTimeChanged: (val) {
                                setState(() {
                                  currentDate = val;

                                });
                              }),
                        ),
                      );
                    },
                    child: Container(

                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(currentDate==null?"Date of birth":"Date of birth : ${currentDate!.day}/${currentDate!.month}/${currentDate!.year}",style: myStyle(14,textColorLight),),
                          Icon(Icons.arrow_drop_down,color: Colors.black54,),
                        ],
                      ),
                    ),
                  ),
                 // Spacer(),
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0,top: 0),
                    child: CustomeButton(onTap: () {
                      if(_formKey.currentState!.validate()){
                        authProvider.setFirstName=firstNameController.text.toString();
                        authProvider.setLastName=lastNameController.text.toString();
                        authProvider.setPhoneNumber=phoneNumberController.text.toString();
                        authProvider.setDateOfBirth=currentDate.toString();
                        print("xxxxxxxxxxxxxx     ${authProvider.getProfileImage}");
                        Navigator.of(context).pushNamed(AddYourSkills.id);
                      }
                    }, title: "Submit & Next"),
                  ),
                  MaterialButton(onPressed: (){
    if(_formKey.currentState!.validate()){
                    Navigator.of(context).pushNamed(AddYourSkills.id);}
                  },
                    child: Text("Skip",style: myStyleBody(),),
                  )



                  // Spacer(),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  DateTime ?currentDate;
  GlobalKey<FormState> _formKey=GlobalKey();

  showOptionDialog(BuildContext context){
    return showDialog(context: context, builder: (context)=>SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: (){
            selectImage(ImageSource.gallery);
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Icon(Icons.image),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Gallery"),
              )
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: (){
            selectImage(ImageSource.camera);
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Icon(Icons.camera),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Camera"),
              )
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Icon(Icons.cancel),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Cancel"),
              )
            ],
          ),
        ),
      ],
    ));
  }



}
