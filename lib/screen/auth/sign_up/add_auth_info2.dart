import 'package:flutter/material.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';

class AddPersonalInfo2 extends StatefulWidget {

  static const String id = 'AddPersonalInfo2';
  const AddPersonalInfo2({Key? key}) : super(key: key);

  @override
  _AddPersonalInfo2State createState() => _AddPersonalInfo2State();
}

class _AddPersonalInfo2State extends State<AddPersonalInfo2> {
  List<String> birthList = <String>['One', 'Two', 'Three', 'Four'];
  List<String> sexList = <String>['Male',"Female"];

  String ? dropdownValue;
  String? sexValue ;
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    "PERSONAL INFORMATION",
                    style: myStyleHeader(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 12),
                    child: Text(
                      "You can change/edit your information later or you can skip now",
                      style: myStyleBody(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        hint: Text("Date of brith"),
                        //  value: dropdownValue,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black54,
                        ),
                        elevation: 16,
                        style: myStyle(
                          12,
                          textColorLight,
                        ),
                        isExpanded: true,
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items: birthList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: sexValue,
                        hint: Text("Sex"),
                        //  value: dropdownValue,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black54,
                        ),
                        elevation: 16,
                        style: myStyle(
                          12,
                          textColorLight,
                        ),
                        isExpanded: true,
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            sexValue = value!;
                          });
                        },
                        items: sexList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),

          Spacer(),
              // Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 0,top: 100),
                child: CustomeButton(onTap: () {
                //  Navigator.of(context).pushNamed(AddPersonalInfo.id);
                }, title: "Submit & Next"),
              ),


              MaterialButton(onPressed: (){},
                child: Text("Skip",style: myStyleBody(),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
