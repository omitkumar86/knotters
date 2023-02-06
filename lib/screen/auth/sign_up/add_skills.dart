import 'package:flutter/material.dart';
import 'package:knotters/http/custome_http.dart';
import 'package:knotters/model/skills_model.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/screen/auth/sign_up/add_education.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';
import 'package:knotters/widget/extra.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

class AddYourSkills extends StatefulWidget {
  static const String id = 'AddYourSkills';

  const AddYourSkills({Key? key}) : super(key: key);

  @override
  _AddYourSkillsState createState() => _AddYourSkillsState();
}

class _AddYourSkillsState extends State<AddYourSkills> {

  final _items = allSkills
      .map((animal) => MultiSelectItem<Animal>(animal, animal.skillName.toString()))
      .toList();

  List<Animal> _selectedSkills = [];
 static List<Animal> allSkills = [];
@override
  void initState() {
    // TODO: implement initState
  getSkills();
  super.initState();
  }

  getSkills()async{
    allSkills=await CustomHttpRequest.fetchAllSkills();
    print("dddddddddddd${allSkills.length}");
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    print("Phone number is ${authProvider.getPhoneNumber}");
    print("Phone number is ${authProvider.getEmail}");
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
                    "ADD YOUR SKILLS",
                    style: myStyleHeader(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    child: Text(
                      "You can select up to 6 skills only",
                      style: myStyleBody(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MultiSelectDialogField(
                    chipDisplay: MultiSelectChipDisplay<Animal>(
                      chipColor: Colors.white,
                      // icon: Icon(Icons.remove_circle_outline),

                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: primaryColor, width: 1),
                          borderRadius: BorderRadius.circular(20)),
                      textStyle: myStyleBody(),
                    ),
                    items: allSkills
                        .map((animal) => MultiSelectItem<Animal>(animal, animal.skillName.toString()))
                        .toList(),
                    title: Text("Skills"),
                    selectedColor: primaryColor,

                    searchable: true,
                    decoration: BoxDecoration(
                      color: primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      border: Border.all(
                        color: primaryColor,
                        width: 1.5,
                      ),
                    ),
                    itemsTextStyle: myStyleBody(),
                    //separateSelectedItems: true,
                    barrierColor: scaffoldColor,
                    buttonIcon: Icon(
                      Icons.arrow_drop_down,
                      color: primaryColor,
                    ),
                    buttonText: Text("  Favorite Skills", style: myStyleBody()),
                    onConfirm: (results) {
                      _selectedSkills = results;
                      authProvider.setSelectedSkilledList=results;
                      print("Selected item length is ${authProvider.getSelectedSkills.length}");
                      print("Selected item length is ${authProvider.getSelectedSkills.length}");
                    },
                  ),
                ],
              ),

              //Spacer(),
              Column(
                children: [
                  // Spacer(),
                  Text(
                    "You have selected ${_selectedSkills.length} items",
                    style: myStyle(14, primaryColor),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 0, top: 20),
                    child: CustomeButton(
                        onTap: () {

                          Navigator.of(context).pushNamed(AddEducation.id);
                        },
                        title: "Submit & Next"),
                  ),

                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AddEducation.id);
                    },
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
    );
  }
}
