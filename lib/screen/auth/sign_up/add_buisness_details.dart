import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/screen/auth/sign_up/add_education.dart';
import 'package:knotters/utlits/utlits.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custom_TextField.dart';
import 'package:knotters/widget/custome_button.dart';
import 'package:provider/provider.dart';


class AddBuisnessDetails extends StatefulWidget {
  static const String id = 'AddBuisnessDetails';
  @override
  State<AddBuisnessDetails> createState() => _AddBuisnessDetailsState();
}


class _AddBuisnessDetailsState extends State<AddBuisnessDetails> {
 // const AddBuisnessDetails({Key? key}) : super(key: key);
  TextEditingController companyNameController=TextEditingController();
  TextEditingController businessBasedInController=TextEditingController();
  TextEditingController phoneNumberController=TextEditingController();

  File? image;

  void selectImage( ImageSource src) async {
    image = await pickImageFromGallery(context,src);
    setState(() {

      Provider.of<AuthProvider>(context,listen: false).setProfileImage=image!;
    });
    print("Done     ${Provider.of<AuthProvider>(context,listen: false).getProfileImage}");
  }
  @override
  void dispose() {
    // TODO: implement dispose
    companyNameController.dispose();
    businessBasedInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                    "ADD BUISNESS DETAILS",
                    style: myStyleHeader(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    child: Text(
                      "You can change/edit your information later or your can skip now",
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
                    validator:  (  value){
                      if(value==null){
                        return "Company/Entry Name required";
                      }
                      if(value.length <3){
                        return "Company/Entry Name too short";
                      }
                    },
                    controller: companyNameController,
                    hintText: "Company/Entry Name",

                  ),
                  SizedBox(height:12,),
                 InkWell(
                   onTap: (){
                     showYearPicker2();
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
                         Text(pickYear==null?"Est Year":"Est Year : ${pickYear!.year}",style: myStyle(14,textColorLight),),
                         Icon(Icons.arrow_drop_down,color: Colors.black54,),
                       ],
                     ),
                   ),
                 ),
                  SizedBox(height:12,),
                  CustomeTextField2(
                    onTap: (){

                    },
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

                  ),
                  SizedBox(height:12,),
                  CustomeTextField2(
                    onTap: (){

                    },
                 /*   validator:  (  value){
                      if(value==null){
                        return "Phone Number required";
                      }
                      if(value.length <3){
                        return "Phone Number too short";
                      }
                    },*/
                    controller: businessBasedInController,
                    hintText: "Based in : (emirate)",

                  ),
                  //Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0,top: 50),
                    child: CustomeButton(onTap: () {
                      if(_formKey.currentState!.validate()){
                        authProvider.setBusinessName=companyNameController.text.toString();
                        authProvider.setBusinessBasedIn=businessBasedInController.text.toString();
                        authProvider.setPhoneNumber=phoneNumberController.text.toString();
                        authProvider.setEstYear=pickYear.toString();
                        Navigator.of(context).pushNamed(AddEducation.id);
                      }
                    }, title: "Submit & Next"),
                  ),
                  MaterialButton(onPressed: (){},
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

  void showYearPicker2() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return AlertDialog(
            title: Text("Select Year"),
            content: Container( // Need to use container to add size constraint.
              width: 300,
              height: 300,
              child: YearPicker(
                firstDate: DateTime(DateTime.now().year - 20, 1),
                lastDate: DateTime(DateTime.now().year, 1),
              //  initialDate:pickYear,
                // save the selected date to _selectedDate DateTime variable.
                // It's used to set the previous selected date when
                // re-showing the dialog.
                //   selectedDate: _selectedDate,
                onChanged: (DateTime dateTime) {
                  // close the dialog when year is selected.
                  setState(() {
                    pickYear=dateTime;
                  });
                  Navigator.pop(context);

                  // Do something with the dateTime selected.
                  // Remember that you need to use dateTime.year to get the year
                }, selectedDate: DateTime.now(),
              ),
            ),
          );
        });
  }

  DateTime ?pickYear;
}
