import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/screen/auth/forget_password/add_reset_otp_page.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';
import 'package:provider/provider.dart';

class SelectResetType extends StatefulWidget {
  static const String id = 'SelectResetType';

  const SelectResetType({Key? key}) : super(key: key);

  @override
  State<SelectResetType> createState() => _SelectResetTypeState();
}

class _SelectResetTypeState extends State<SelectResetType> {
  bool isSms = true;

  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: SvgPicture.asset("assets/onboarding.svg",
                      semanticsLabel: 'A red up arrow')),
              SizedBox(
                height: 30,
              ),
              Text(
                "SELECT WHERE YOU WANT \nTO GET CODE",
                style: myStyle(20, Colors.black87, FontWeight.w700),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(

                onTap: () {
                  setState(() {
                    isSms = true;
                  });
                },
                // selected: isSms == true,
                minLeadingWidth: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color:isSms? primaryColor :Colors.transparent, width: 1),
                ),
                leading: CircleAvatar(
                  backgroundColor: primaryColorLight,
                  child: Icon(
                    Icons.chat,
                    color: primaryColor,
                  ),
                ),

                trailing: Icon(
                  isSms == true
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color:isSms == true ? primaryColor : Colors.black87,
                  size: 18,
                ),
                title: Text(
                  "Via SMS",
                  style: myStyle(
                      18,
                      isSms == true ? primaryColor : Colors.black87,
                      FontWeight.w700),
                ),

                tileColor: Colors.white,
                subtitle: Text(
                  "+0000***88",
                  style: myStyle(
                      14,
                      isSms == true ? primaryColor : Colors.black54,
                      FontWeight.w400),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    isSms = false;
                  });
                },
                tileColor: Colors.white,
                leading: CircleAvatar(
                  backgroundColor: primaryColorLight,
                  child: Icon(
                    Icons.email_outlined,
                    color: primaryColor,
                    size: 20,
                  ),
                ),
                // selected: isSms == true,
                minLeadingWidth: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: !isSms?primaryColor :Colors.transparent, width: 1),
                ),
                trailing: Icon(
                  isSms == false
                      ? Icons.radio_button_checked
                      : Icons.radio_button_off,
                  color: isSms == false ? primaryColor:Colors.black87,
                  size: 18,
                ),
                title: Text(
                  "Via E-male",
                  style: myStyle(
                      18,
                      isSms == false ? primaryColor : Colors.black87,
                      FontWeight.w700),
                ),
                subtitle: Text(
                  "knotter***@gmail.com",
                  style: myStyle(
                      14,
                      isSms == false ?primaryColor : Colors.black54,
                      FontWeight.w400),
                ),
              ),
              Spacer(),
              CustomeButton(
                  onTap: () {
                    //Navigator.of(context).pushNamed(AddEducation.id);
                     Navigator.of(context).pushNamed(AddResetOtpPage.id);
                  },
                  title: "Next"),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
