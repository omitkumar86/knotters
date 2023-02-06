import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:knotters/screen/auth/forget_password/create_new_password.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';

class AddResetOtpPage extends StatelessWidget {
  static const String id = 'AddResetOtpPage';
  const AddResetOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          children: [
            AppbarButton(onTap: () {
              Navigator.of(context).pop();
            }),
            SizedBox(
              height: 30,
            ),
            Text(
              "RESET YOUR PASSWORD",
              style: myStyleHeader(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              child: Text(
                "4-digit Code has been send to your registered number +8800*******88",
                style: myStyleBody(),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: Column(
                children: [
                  OtpTextField(
                    numberOfFields: 4,
                    borderColor: textColorLight,
                      keyboardType: TextInputType.number,
                    cursorColor: primaryColorLight,

                    focusedBorderColor: primaryColorLight,
                    // styles: myStyleHeader(),
                    showFieldAsBox: true,
                    borderWidth: 3.0,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here if necessary
                      print("On chnnging ");
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      print("on Submit $verificationCode");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomeButton(onTap: () {
                    Navigator.of(context).pushNamed(CreateNewPassword.id);
                  }, title: "Verify"),
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Don't Received any code ?",
                    style: myStyleBody(),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Resend Again",
                    style: myStyle(12, primaryColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}

/*OtpTextField(
        numberOfFields: 4
        ,

        borderColor: textColorLight,
        focusedBorderColor: Colors.black,
       // styles: myStyleHeader(),
        showFieldAsBox: true,
        borderWidth: 4.0,
        //runs when a code is typed in
        onCodeChanged: (String code) {
          //handle validation or checks here if necessary
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode) {

        },
      ), */
