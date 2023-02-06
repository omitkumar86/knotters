import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_connect.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:knotters/http/custome_http.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/screen/auth/choose_auth.dart';
import 'package:knotters/utlits/utlits.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custom_TextField.dart';
import 'package:knotters/widget/custome_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

class AddEducation extends StatefulWidget {
  static const String id = 'AddEducation';

  const AddEducation({Key? key}) : super(key: key);

  @override
  _AddEducationState createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  List<String> areYourListStudent = <String>[
    'High School Graduate',
    "University Student",
    "Fresh Graduate",
    "Other"
  ];
  List<String> areYourListSme = <String>[
    'Start-up, young Company',
    "Enterprise, Government",
    "Entry, Private Entry, Others",
    "Other"
  ];
  List<String> universityList = <String>[
    'Zayed University - Abu Dhabi',
    "Zayed University - Dubai",
    "Khalifa University of Science and Technology",
    "Abu Dhabi University",
    "Fatima Collete of Health Science",
    "AYU Abu Dhabi",
    "Higher Colleges of Technology",
    "Sorbonne University, Abu Dhabi",
    "United Arab Emirates University",
    "Ajman University",
    "American University of Sharjah",
    "Others"
  ];
  List<String> companySizeList = <String>[
    "01-10 Person",
    "15-50 Person",
    "51-1000 Person or more",
    "Others"
  ];
  List<String> sectorList = <String>[
    "Event Management",
    "Hospitals",
    "Ecommerce Industry",
    "Food Industry",
    "Garments and Textiles",
    "Financial Industry",
    "Agribusiness",
    "Power Industry",
    "AutoMobiles Industry",
    "Others"
  ];
  List<String> servicesList = <String>[
    "Event Management",
    "Hospitals",
    "Ecommerce Industry",
    "Food Industry",
    "Garments and Textiles",
    "Financial Industry",
    "Agribusiness",
    "Power Industry",
    "AutoMobiles Industry",
    "Others"
  ];
  String? universityValue,
      companySizeValue,
      areYouValue,
      sectorValue,
      servicesValue;

  TextEditingController bankAccountController = TextEditingController();
  TextEditingController emiratesIdController = TextEditingController();
  TextEditingController tradeLicenseController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  FocusNode bankAccountFocusNode = FocusNode();
  FocusNode emirateIdFocusNode = FocusNode();
  late AuthProvider authProvider;

  @override
  void initState() {
    // TODO: implement initState
    authProvider = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  bool onProgress = false;
  List<File> documentList = [];
  List<String> documentPath = [];

  void selectImage(ImageSource src) async {
    var image = await pickImageFromGallery(context, src);
    documentList.add(image!);
    documentPath.add(image.path);
    setState(() {});
  }

  //final form= FormData({});



  Future registerUser(BuildContext context) async {
    try {
      setState(() {
        onProgress = true;
      });
      final uri =
          Uri.parse("${baseUrl}register-user");
      var request = http.MultipartRequest("POST", uri);
      //request.fields['email'] ="qwertyu@gmail.com";
     request.fields['email'] = authProvider.getEmail.toString();
      request.fields['password'] = authProvider.getPassword.toString();
     // request.fields['password'] = "123456";
      request.fields['user_role_type'] =
          authProvider.getAccountType ? "1" : "2";
      request.fields['country'] = authProvider.getNationality.toString();
      request.fields['emirate_state_name'] = authProvider.getEmirate.toString();
      if (authProvider.getProfileImage != null) {
        var userImage = await http.MultipartFile.fromPath(
            'profile_image', authProvider.getProfileImage!.path);
        request.files.add(userImage);
      }
      if (documentList.isNotEmpty) {
        int x = 0;
        for (var i in documentList) {
          var userImage = await http.MultipartFile.fromPath(
              'user_document_files[$x]', i!.path);
          // print('${userImage.field} ${userImage.filename}');
          setState(() {
            x++;
          });
          request.files.add(userImage);
        }
      }
      if (authProvider.getAccountType==true) {
        request.fields['first_name'] = authProvider.getFirstName.toString();
        request.fields['last_name'] = authProvider.getFirstName.toString();
        request.fields['phone'] = authProvider.getPhoneNumber.toString();
        request.fields['dob'] = authProvider.getDateOfBirth.toString();
        for (var i in authProvider.getSelectedSkills) {
          request.fields['skills[${i.id}]'] = i.id.toString();
        }
        request.fields['educational_status'] = areYouValue.toString();
        request.fields['university_name'] = universityValue.toString();
        request.fields['bank_account_no'] =
            bankAccountController.text.toString();
        request.fields['emirates_id_no'] = emiratesIdController.text.toString();
        request.fields['name'] = authProvider.getFirstName.toString();
     }else{
        request.fields['company_name'] = authProvider.getBusinessName.toString();
        request.fields['company_establish_year'] = authProvider.getEstYear.toString();
        request.fields['company_status'] = areYouValue.toString();
        request.fields['business_name'] =businessNameController.text.toString();
        request.fields['company_size'] =companySizeValue.toString();
        request.fields['company_speciality'] =sectorValue.toString();
        request.fields['company_service'] =servicesValue.toString();
        request.fields['trade_license_no'] =tradeLicenseController.text.toString();
        request.fields['name'] = authProvider.getBusinessName.toString();
      }
      print("eeeeeeeeeeeeeeeeeee  ${request.fields}");
      var response = await request.send();
      print(response);
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      var data = jsonDecode(responseString.toString()  );
      setState(() {
        onProgress = false;
      });
  print("API responseBody is $data $responseString"  );

      //  print(data);
      print("stattus code is ${response.statusCode}");
      if (response.statusCode == 200) {
        debugPrint("responseBody1 " + responseString);
        var data = jsonDecode(responseString);
        if(data["success"]==false){
          print("${data["success"]}");
          showSnackBar(context: context, content: "${data["data"]["email"][0]}");
        }else{
          congratulationsDialog(ctx: context);
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pop();
      Navigator.of(context).pushNamedAndRemoveUntil(ChooseAuth.id, (route) => false);
          });
        }

      } else {
        var errorr = jsonDecode(responseString.trim().toString());

        print("Registered failed " + responseString);
      }
    } catch (e) {
      setState(() {
        onProgress=false;
      });
      print("something went wronggggggggggggggggg in code $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    final isStudent = Provider.of<AuthProvider>(context).getAccountType;
    //  final authProvider = Provider.of<AuthProvider>(context);
    //  print("Selected item length is ${authProvider.getSelectedSkills.length}");
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: onProgress == true,
        // demo of some additional parameters
        opacity: 0.5,
        blur: 0.5,
        progressIndicator: spinkit,
        child: Scaffold(
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      AppbarButton(onTap: () {
                        Navigator.of(context).pop();
                      }),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        isStudent
                            ? "ADD YOUR EDUCATION"
                            : "ADD BUSINESS DETAILS",
                        style: myStyleHeader(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 12),
                        child: Text(
                          "You can change/edit your information later or\n you can skip now",
                          style: myStyleBody(),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomeDropDownButton(
                        onChange: (value) {
                          setState(() {
                            areYouValue = value!;
                          });
                          // authProvider.setNationality=value;
                        },
                        title: "Are you",
                        dropdownList:
                            isStudent ? areYourListStudent : areYourListSme,
                        dropdownValue: areYouValue,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Visibility(
                          visible: isStudent,
                          child: Column(
                            children: [
                              CustomeDropDownButton(
                                onChange: (value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    universityValue = value!;
                                  });
                                  // authProvider.setNationality=value;
                                },
                                title: "Select University or School",
                                dropdownList: universityList,
                                dropdownValue: universityValue,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              CustomeTextField2(
                                textInputAction: TextInputAction.next,
                                focusNode: bankAccountFocusNode,
                                validator: (val) {},
                                controller: bankAccountController,
                                hintText: "Bank Account ( Optional )",
                                //  prefixIcon: Icon(Icons.drive_file_rename_outline,color: primaryColor,size: 14,),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              CustomeTextField2(
                                focusNode: emirateIdFocusNode,
                                validator: (val) {},
                                controller: emiratesIdController,
                                hintText: "Emirates ID No",
                                //  prefixIcon: Icon(Icons.drive_file_rename_outline,color: primaryColor,size: 14,),
                              ),
                            ],
                          )),
                      Visibility(
                          visible: !isStudent,
                          child: Column(
                            children: [
                              CustomeTextField2(
                                validator: (val) {},
                                controller: emiratesIdController,
                                hintText: "Business Name",
                                //  prefixIcon: Icon(Icons.drive_file_rename_outline,color: primaryColor,size: 14,),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              CustomeDropDownButton(
                                onChange: (value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    companySizeValue = value!;
                                  });
                                  // authProvider.setNationality=value;
                                },
                                title: "Company Size",
                                dropdownList: companySizeList,
                                dropdownValue: companySizeValue,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              CustomeDropDownButton(
                                onChange: (value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    sectorValue = value!;
                                  });
                                  // authProvider.setNationality=value;
                                },
                                title: "Sector/Speciality",
                                dropdownList: sectorList,
                                dropdownValue: sectorValue,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              CustomeDropDownButton(
                                onChange: (value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    servicesValue = value!;
                                  });
                                  // authProvider.setNationality=value;
                                },
                                title: "Select Services",
                                dropdownList: servicesList,
                                dropdownValue: servicesValue,
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              CustomeTextField2(
                                validator: (val) {},
                                controller: tradeLicenseController,
                                hintText: "Trade Licence no",
                                //  prefixIcon: Icon(Icons.drive_file_rename_outline,color: primaryColor,size: 14,),
                              ),
                            ],
                          )),
                      Container(
                        padding: EdgeInsets.all(16),
                        margin: EdgeInsets.only(top: 12, bottom: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                _showMyDialog();
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 16),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.white,
                                    border: Border.all(
                                        color: primaryColor, width: 2)),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.upload_rounded,
                                      color: primaryColor,
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      isStudent
                                          ? "Upload Photo ID"
                                          : "Upload Trade License",
                                      style: myStyleBody(),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            // Text("${imageList.length} Photos added"),
                            ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: documentList.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: 12),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 4),
                                    decoration: BoxDecoration(
                                        color: buttonBackgroundColor,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        ClipRRect(
                                          child: Image.file(
                                            documentList[index]!,
                                            height: 40,
                                            width: 50,
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              documentList.removeAt(index);
                                            });
                                          },
                                          icon: Icon(
                                            Icons.highlight_remove,
                                            color: primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ],
                        ),
                      )
                    ],
                  ),

                  //Spacer(),
                  Column(
                    children: [
                      // Spacer(),

                      Padding(
                        padding: EdgeInsets.only(bottom: 0, top: 20),
                        child: CustomeButton(
                            onTap: () {
                              //  Navigator.of(context).pushNamed(AddPersonalInfo.id);

                              /* authProvider.setAreYou=areYouValue.toString();
                                authProvider.setUniversityName=universityValue.toString();
                                authProvider.setBankAccount=bankAccountController.text.toString();
                                authProvider.setEmiratesIdNo=emiratesIdController.text.toString();
                                authProvider.setDocumentList=documentList;*/
                              /*  print("first name is ${authProvider.getFirstName}");
                                print("email   is ${authProvider.getEmail}");
                                print("phone number is ${authProvider.getPhoneNumber}");
                                print("skills are ${authProvider.getSelectedSkills }");
                                print("Emirate is ${authProvider.getEmirate.toString()}");
                                print("nationality is ${authProvider.getNationality.toString()}");
                                print("date of birth is ${authProvider.getDateOfBirth.toString()}");
                                print("profile_image  is ${authProvider.getProfileImage }");
                                print("Are you  is ${authProvider.getAreYou.toString()}");
                                print("bankAccount  is ${bankAccountController.text.toString()}");

                                print("university_name   is ${authProvider.getUniversityName.toString()}");
                                print("emirates_id_no   is ${authProvider.getEmiratesIdNo.toString()}");
                                print("user_role_type is  ${authProvider.getAccountType? 0: 1 }");*/
                              //registerUser(context);
                              // uploadData();
                              registerUser(context);

                              print("Are you value is ${areYouValue}");
                              /*  congratulationsDialog(context).then((value) =>
                                  Future.delayed(Duration(seconds: 0), () {

                                    Navigator.of(context).pushNamedAndRemoveUntil(
                                        ChooseAuth.id, (route) => false);
                                  }));*/
                            },
                            title: "Submit & Next"),
                      ),

                      MaterialButton(
                        onPressed: () {},
                        child: Text(
                          "Skip",
                          style: myStyleBody(),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showMyDialog() async {
    return showDialog(
      context: context,

      //  barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              content: Container(
                height: MediaQuery.of(context).size.height * 0.65,
                width: double.maxFinite,
                child: ListView(
                  children: [
                    Center(
                        child: Text(
                      "Upload Emirates ID",
                      style: myStyle(18, primaryColor, FontWeight.w600),
                    )),
                    SizedBox(
                      height: 8,
                    ),
                    Center(
                        child: Text(
                      "Upload Both side of your Emirates ID",
                      style: myStyleBody(),
                    )),
                    SizedBox(
                      height: 20,
                    ),
                    CustomeButton(
                        onTap: () async {
                          var image = await pickImageFromGallery(
                              context, ImageSource.gallery);
                          print("jjjjjjjjjj");
                          documentList.add(image!);
                          print("jjjjjjjjjj");
                          setState(() {});
                        },
                        title: "Select from Gallery"),
                    SizedBox(
                      height: 8,
                    ),
                    CustomeBorderButton(
                        onTap: () async {
                          var image = await pickImageFromGallery(
                              context, ImageSource.camera);

                          documentList.add(image!);
                          setState(() {});
                        },
                        title: "Select from Camera"),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Pervious Upload",
                      style: myStyleBody(),
                    ),
                    Divider(),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: documentList.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(bottom: 6),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                                color: buttonBackgroundColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  child: Image.file(
                                    documentList[index]!,
                                    height: 40,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          );
                        }),
                    MaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Submit"),
                      elevation: 0,
                      color: Colors.white,
                      minWidth: 150,
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    ).then((value) => setState(() {}));
  }
}

class CustomeDropDownButton extends StatefulWidget {
  CustomeDropDownButton(
      {Key? key,
      this.dropdownValue,
      this.dropdownList,
      this.title,
      this.onChange,
      this.validator})
      : super(key: key);
  String? dropdownValue, title;
  List<String>? dropdownList;
  final dynamic validator, onChange;

  @override
  State<CustomeDropDownButton> createState() => _CustomeDropDownButtonState();
}

class _CustomeDropDownButtonState extends State<CustomeDropDownButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16 ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedBorder: InputBorder.none),
          validator: widget.validator,
          hint: Text(
            "${widget.title}",
            style: myStyle(14, textColorLight),
          ),
          value: widget.dropdownValue,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.black54,
          ),
          elevation: 16,
          style: myStyle(
            12,
            textColorLight,
          ),
          onChanged: widget.onChange,
          items: widget.dropdownList!
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
