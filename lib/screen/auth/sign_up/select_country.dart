import 'package:flutter/material.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/screen/auth/sign_up/add_buisness_details.dart';
import 'package:knotters/screen/auth/sign_up/add_education.dart';
import 'package:knotters/screen/auth/sign_up/add_personal_info.dart';
import 'package:knotters/utlits/utlits.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';
import 'package:provider/provider.dart';

class SelectCountry extends StatefulWidget {
  static const String id = 'SelectCountry';

  const SelectCountry({Key? key}) : super(key: key);

  @override
  _SelectCountryState createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  List<String> nationalityList = <String>['UAE'];
  List<String> emirateList = <String>['One', 'Two', 'Three', 'Four'];
  String ?nationalityValue;
  String ?emirateValue;


  GlobalKey<FormState> _formKey=GlobalKey();

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
                      "SELECT YOUR COUNTRY",
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



                    CustomeDropDownButton(
                      validator: ( val){
                        if(val==null){
                          return "Nationality Required";
                        }
                      },onChange:  ( value)  {
                      // This is called when the user selects an item.
                      setState(() {
                        nationalityValue = value!;
                      });
                      authProvider.setNationality=value;

                    },
                      title: "Select Your Nationality",
                      dropdownList: nationalityList,
                      dropdownValue: nationalityValue,

                    ),
                    SizedBox(height: 16,),
                    CustomeDropDownButton(
                      validator: ( val){
                        if(val==null){
                          return "Emirate Required";
                        }
                      },
                      onChange:  ( value)async {
                        // This is called when the user selects an item.
                        setState(() {
                          emirateValue = value!;
                        });
                        authProvider.setEmirate=value;
                        print("xxxx${authProvider.getEmirate}");
                        print("cccc${authProvider.getNationality}");
                      },
                      title: "Select Your Emirate",
                      dropdownList: emirateList,
                      dropdownValue: emirateValue,

                    ),

                  ],
                ),

                Text(
                  " We are currently operating in the UAE.\n We'r aiming to expand to other \ncountries soon",
                  style: myStyle(14, primaryColor, FontWeight.w400),
                  textAlign: TextAlign.center,
                ),

                // Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: CustomeButton(onTap: () {
                    if(_formKey.currentState!.validate()){
                      authProvider.setEmirate=emirateValue.toString();
                      authProvider.setNationality=nationalityValue.toString();
                     Navigator.of(context).pushNamed(authProvider.getAccountType
                         ? AddPersonalInfo.id
                         : AddBuisnessDetails.id);
                   }else{
                     print("Something wrong");
                   }
                  }, title: "Next"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
