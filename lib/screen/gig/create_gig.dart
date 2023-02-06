import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:knotters/http/custome_http.dart';
import 'package:knotters/model/gig_category_model.dart';
import 'package:knotters/screen/auth/sign_up/add_education.dart';
import 'package:knotters/utlits/utlits.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custom_TextField.dart';
import 'package:knotters/widget/custome_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';


class CreateGigPage extends StatefulWidget {
  static const String id = 'CreateGigPage';
  const CreateGigPage({Key? key}) : super(key: key);
  @override
  State<CreateGigPage> createState() => _CreateGigPageState();
}

class _CreateGigPageState extends State<CreateGigPage> {
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController gigTypeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController costController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<String> levelList = <String>[
    'Excited',
    'Eager',
    'Experienced',
    'Expert'
  ];
  String? categoryValue;
  String? subCategoryValue;
  String? levelValue;
  int levelId = 0;
  List<GigCategoryModel> categoryListt = [];
  GigCategoryModel? gigCategoryModel;
  String? _myCategory;
  String? _mySubCategory;
  List? categoryList;
  List? subCategoryList;
  @override
  void initState() {
    // TODO: implement initState
    getCategory();
    super.initState();
  }


  getCategory() async {
    setState(() {
    });
    var res = await http.get(
        Uri.parse(
          "${baseUrl}client/job-post-form",
        ),
        headers: await CustomHttpRequest.getHeaderWithToken());
    if (res.statusCode == 200) {
     var data = json.decode(res.body);
      setState(() {
        onProgress = false;
        if (data["skillCategories"] != null) {
          categoryList = data["skillCategories"];
        }
      });
    } else {
      print("something wrong");
      setState(() {
        onProgress=false;
        showSnackBar(context: context, content: "Error during fetching data") ;
      });
    }
  }

  String?  message;

  getSubCategory() async {
    setState(() {
      onProgress=true;
    });
    var res = await http.get(
        Uri.parse(
          "${baseUrl}get-skill-sub-categories/${_myCategory}",
        ),
        headers: await CustomHttpRequest.getHeaderWithToken());
    if (res.statusCode == 200) {
      var data = json.decode(res.body);
      print("Sub category are $data");
      setState(() {
        onProgress = false;
        if (data != null) {
          subCategoryList = data;
        }
      });
    } else {
      print("something wrong");
      setState(() {
        onProgress=false;
        showSnackBar(context: context, content: "Error during fetching data") ;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: onProgress==true,
        blur: 0.5,
        progressIndicator: spinkit,
        opacity: 0.5,
        child: Container(
          padding: EdgeInsets.fromLTRB(12, 20, 12, 0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Create a GIG",
                    style: myStyle(20, Colors.black, FontWeight.w700),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  SizedBox(
                    height: 12,
                  ),
                  CustomeTextField2(
                    textInputAction: TextInputAction.next,
                    // focusNode: bankAccountFocusNode,
                    validator:  (  value){
                      if(value==null){
                        return "Gig Type is  required";
                      }
                      if(value.length <5){
                        return "Gig Type too short";
                      }
                    },
                    controller: gigTypeController,
                    hintText: "Gig Type",
                      ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                          hint: Text(
                            'Choose Category',
                            overflow: TextOverflow.ellipsis,
                            style: myStyle(14, textColorLight),
                          ),
                          onChanged: (String? newValue) {


                            setState(() {
                              _myCategory = newValue;
                              getSubCategory();
                              print("my Category is ${_myCategory}");
                              if (_myCategory!.isEmpty) {
                                showSnackBar(context: context, content:"No Category Found");
                                //return "Required";
                              }
                              // print();
                            });

                          },
                          validator: (value) =>
                          value == null ? 'field required' : null,
                          items: categoryList?.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(
                                "${item['category_name']}",
                                style: myStyle(14, textColorLight),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              value: item['id'].toString(),
                            );
                          })?.toList() ??
                              [],
                        ),
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButtonFormField<String>(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black54,
                          ),
                          decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                          hint: Text(
                            'Choose Sub-Category',
                            overflow: TextOverflow.ellipsis,
                            style: myStyle(14, textColorLight),
                          ),
                          onChanged: (String? newValue) {


                            setState(() {
                              _mySubCategory = newValue;

                              print("my Category is ${_mySubCategory}");
                              if (_mySubCategory!.isEmpty) {
                                showSnackBar(context: context, content:"No Category Found");
                                //return "Required";
                              }
                              // print();
                            });
                          },
                          validator: (value) =>
                          value == null ? 'field required' : null,
                          items: subCategoryList?.map((item) {
                            return new DropdownMenuItem(
                              child: new Text(
                                "${item['sub_category_name']}",
                                style: myStyle(14, textColorLight),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              value: item['id'].toString(),
                            );
                          })?.toList() ??
                              [],
                        ),
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  CustomeDropDownButton(
                    validator: (val) {
                      if (val == null) {
                        return "Level Required";
                      }
                    },
                    onChange: (value) {
                      value == 'Excited'
                          ? levelId = 0
                          : value == 'Eager'
                          ? levelId = 1
                          : value == 'Experienced'
                          ? levelId = 2
                          : value == 'Expert'
                          ? levelId = 3
                          : null;
                      setState(() {
                        levelValue = value!;
                      });
                      print("level id is $levelId");
                    },
                    title: "Lavel",
                    dropdownList: levelList,
                    dropdownValue: levelValue,
                  ),

                 /* CustomeDropDownButton(
                    validator: (val) {
                      if (val == null) {
                        return "Deadline Required";
                      }
                    },
                    onChange: (value) {
                      // This is called when the user selects an item.
                      setState(() {
                        categoryValue = value!;
                      });
                    },
                    title: "Deadline",
                   // dropdownList: categoryList,
                    dropdownValue: categoryValue,
                  ),*/
                  SizedBox(
                    height: 12,
                  ),
                  CustomeTextField2(
                    keyType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    validator: (val) {
                      if (val == null) {
                        return "Cost Required";
                      }
                    },
                    controller: costController,

                    hintText: "Cost",
                   ),
                  SizedBox(
                    height: 12,
                  ),
                  CustomeTextField2(
                    textInputAction: TextInputAction.next,
                    maxLine: 4,
                    // focusNode: bankAccountFocusNode,
                    validator: (val) {},
                    controller: descriptionController,

                    hintText: "Gig Description",
                    //  prefixIcon: Icon(Icons.drive_file_rename_outline,color: primaryColor,size: 14,),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  if (docFiles != null)
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: docFiles!.length,
                        itemBuilder: (context, index) {
                          final file = docFiles![index];
                          final kb = file.size / 1024;
                          final mb = kb / 1024;
                          final fileSize = mb >= 1
                              ? "${mb.toStringAsFixed(2)} MB"
                              : "${kb.toStringAsFixed(2)} KB";
                          final extension = file.name ?? "none";
                          // final color=getColor(extension);
                          return Container(
                            margin: EdgeInsets.only(bottom: 12),
                            padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                                color: buttonBackgroundColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Text(
                                    "${extension}",
                                    style: myStyle(14, Colors.black54),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "${fileSize}",
                                    style: myStyle(14, Colors.black54),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      docFiles!.removeAt(index);
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
                  Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: primaryColor, width: 1)),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: InkWell(
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: primaryColor,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Attachment",
                              style: myStyle(16, Colors.black54),
                            )
                          ],
                        ),
                        onTap: () async {
                          final result = await FilePicker.platform
                              .pickFiles(allowMultiple: true);
                          if (result == null) return;
                          final file = result.files.first;
                          print("name is  ${file.name}");
                          print("Size is  ${file.size}");
                          print("Extension is  ${file.extension}");
                          print("path is  ${file.path}");
                          // openFile(file);
                          docFiles = result.files;
                          setState(() {});
                          // docFile=await saveFile(file);
                          print("from path =${file.path!}");
                          //print("To path =${docFile.path!}");
                        },
                      )),
                  CheckboxListTile(
                    activeColor: primaryColor,
                    value: isChecked1,
                    onChanged: (bool? newValue) {
                      //onChanged(newValue!);
                      setState(() {
                        isChecked1 = newValue!;
                      });
                    },
                    title: Text(
                      "For in-person gigs, 60 AED will be added for transpotation.",
                      style: myStyle(14, textColorLight),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  CheckboxListTile(
                    activeColor: primaryColor,
                    value: isChecked2,
                    onChanged: (bool? newValue) {
                      //onChanged(newValue!);
                      setState(() {
                        print("dsfsdf");
                        isChecked2 = newValue!;
                      });
                    },
                    title: Text(
                      "For in-person gigs,if 24/48 hour PCR is required, 40 AED will be added",
                      style: myStyle(14, textColorLight),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  CustomeButton(
                      onTap: () {
                        if(_formKey.currentState!.validate()){
                          isChecked1 &&isChecked2 ==true?  uploadGig(context) :showSnackBar(context: context, content: "Pls accept terms and conditions");
                        }

                      },
                      title: "Create GIG"),
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      "Cancel",
                      style: myStyleBody(),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }

  bool isChecked1 = false;
  bool isChecked2 = false;
  bool onProgress = false;
  List<PlatformFile>? docFiles;


  openFiles(List<PlatformFile> files) {
    //return
  }

  Future<File> saveFile(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File("${appStorage.path}/${file.name}");
    return newFile;
  }

  void openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  Future uploadGig(BuildContext context) async {
    try {
      setState(() {
        onProgress = true;
      });
      final uri = Uri.parse("${baseUrl}client/job-post");
      var request = http.MultipartRequest("POST", uri);
      request.headers.addAll(await CustomHttpRequest.getHeaderWithToken());
      request.fields['skill_category_id'] = _myCategory.toString();
      request.fields['skill_sub_category_id'] = _mySubCategory.toString();
      // request.fields['client_user_id'] = "138";
      request.fields['project_title'] = gigTypeController.text.toString();
      request.fields['project_description'] =  descriptionController.text.trim().toString();
      request.fields['experience_level'] = levelId.toString();
      request.fields['budget'] = costController.text.trim().toString();
      //  request.fields['freelancer_working_type'] = "8";
      request.fields['job_ending_time'] = "12/12/2022";
      if (docFiles != null) {
        int x = 0;
        for (var i in docFiles!) {
          var userImage = await http.MultipartFile.fromPath(
              'files[$x]', i!.path.toString());
          // print('${userImage.field} ${userImage.filename}');
          setState(() {
            x++;
          });
          request.files.add(userImage);
        }
      }
      print("eeeeeeeeeeeeeeeeeee  ${request.fields} ${request.files}");
      var response = await request.send();
      print(response.statusCode);
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      setState(() {
        onProgress = false;
      });
      var data = jsonDecode(responseString);
      print("API responseBody ${data}");
      print("stattus code is ${response.statusCode}");
      if (response.statusCode == 200) {
        congratulationsDialog(ctx: context,title: "Congratulations !",subTitle: "You've created a Gig. It will be approved and posted shortly");
        Future.delayed(Duration(milliseconds: 3000), () {
          // Navigator.of(context).pushNamedAndRemoveUntil(ChooseAuth.id, (route) => false);
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        });

      } else {
       showSnackBar(context: context, content: "Something Wrong, Pls try again");

        print("Registered failed " + responseString);
      }
    } catch (e) {
      setState(() {
        onProgress = false;
      });
      print("something went wronggggggggggggggggg $e");
    }
  }
}
//
