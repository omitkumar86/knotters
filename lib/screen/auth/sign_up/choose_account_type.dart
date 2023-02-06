import 'package:flutter/material.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/screen/auth/sign_up/add_education.dart';
import 'package:knotters/screen/auth/sign_up/create_email_password.dart';
import 'package:knotters/screen/auth/sign_up/select_country.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';
import 'package:provider/provider.dart';

class ChooseAccountType extends StatefulWidget {
  static const String id = 'ChooseAccountType';

  ChooseAccountType({Key? key}) : super(key: key);

  @override
  State<ChooseAccountType> createState() => _ChooseAccountTypeState();
}

class _ChooseAccountTypeState extends State<ChooseAccountType> {
  bool isStudent = true;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              AppbarButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "SELECT ACCOUNT TYPE",
                style:myStyleHeader(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 12),
                child: Text(
                  "Depending on your selection we will show you our services",
                  style: myStyleBody(),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                onTap: () {
                  authProvider.setAccountType = true;
                  print("xxxxxxxxxxxxxxxxxx isss ${authProvider.getAccountType}");
                  setState(() {
                    isStudent = true;
                  });
                },
               // selected: isStudent == true,
                minLeadingWidth: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: primaryColor, width: 1),
                ),
                tileColor:isStudent == true ?primaryColor:Colors.transparent,
                leading: Icon(
                  isStudent == true ?Icons.radio_button_checked:Icons.radio_button_off,
                  color: isStudent == true ? Colors.white:Colors.black54,
                  size: 18,
                ),
                title: Text(
                  "Student / Youth",
                  style: myStyle(18,isStudent == true ? Colors.white:Colors.black54, FontWeight.w700),
                ),
                subtitle: Text(
                  "( I'm exploring gigs)",
                  style: myStyle(14,isStudent == true ? Colors.white:Colors.black54, FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ListTile(
                onTap: () {
                  authProvider.setAccountType = false;
                  print("xxxxxxxxxxxxxxxxxx isss ${authProvider.getAccountType}");
                  setState(() {
                    isStudent = false;
                  });
                },
                // selected: isStudent == true,
                minLeadingWidth: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: primaryColor, width: 1),
                ),
                tileColor:isStudent == false ?primaryColor:Colors.transparent,
                leading: Icon(
                  isStudent == false ?Icons.radio_button_checked:Icons.radio_button_off,
                  color: isStudent == false ? Colors.white:Colors.black54,
                  size: 18,
                ),
                title: Text(
                  "Buisness/ Enterprise owner",
                  style: myStyle(18,isStudent == false ? Colors.white:Colors.black54, FontWeight.w700),
                ),
                subtitle: Text(
                  "( I'm posting a gigs)",
                  style: myStyle(14,isStudent == false ? Colors.white:Colors.black54, FontWeight.w400),
                ),
              ),
              Spacer(),
              CustomeButton(onTap: (){
                //Navigator.of(context).pushNamed(AddEducation.id);
                Navigator.of(context).pushNamed(CreateEmailPassword.id);
              }, title: "Next"),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
