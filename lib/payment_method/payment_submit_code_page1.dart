import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:knotters/screen/auth/forget_password/create_new_password.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';

class PaymentSubmitCodePage1 extends StatefulWidget {
  const PaymentSubmitCodePage1({Key? key}) : super(key: key);

  @override
  State<PaymentSubmitCodePage1> createState() => _PaymentSubmitCodePage1State();
}

class _PaymentSubmitCodePage1State extends State<PaymentSubmitCodePage1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // AppbarButton(onTap: () {
                  //   Navigator.of(context).pop();
                  // }),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      Text("SUBMIT CODE", style: myStylePaymentHeader(),),
                      SizedBox(height: 15,),
                      Text(
                        "4-digit Code has been send to your registered number +000*******88..",
                        style: myStyle(15, textColorLight),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20,),
                      OtpTextField(
                        numberOfFields: 4,
                        borderColor: primaryBlack,
                        keyboardType: TextInputType.number,
                        cursorColor: primaryColorLight,
                        focusedBorderColor: primaryColorLight,
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
                    ],
                  ),),
                ],
              ),
            ),
          )),
    );
  }
}
