import 'package:flutter/material.dart';
import 'package:knotters/screen/auth/choose_auth.dart';
import 'package:knotters/screen/auth/sign_up/choose_account_type.dart';
import 'package:knotters/utlits/utlits.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custom_TextField.dart';
import 'package:knotters/widget/custome_button.dart';

class CreateNewPassword extends StatefulWidget {
  static const String id = 'CreateNewPassword';

  CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController rePasswordController = TextEditingController();
  bool isObsecure = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.only(top: 0, bottom: 16, left: 16, right: 16),
          width: double.infinity,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          height: 200,
                          width: 200,
                          padding: EdgeInsets.all(22),
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.3),
                              shape: BoxShape.circle),
                          child: Container(
                            height: 200,
                            width: 200,
                            padding: EdgeInsets.all(30),
                            decoration: BoxDecoration(
                                color: primaryColor, shape: BoxShape.circle),
                            child: Image.asset("assets/choose_auth.png"),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          "Create New Password",
                          style: myStyle(25, Colors.black87, FontWeight.w900),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      CustomeTextField(
                       // boarderColor: primaryColor,
                        validator: (value) {
                          if (value == null) {
                            return "Password required";
                          }
                          if (value.length < 3) {
                            return "Password too short";
                          }
                          if (passwordController.text !=
                              rePasswordController.text) {
                            return "Password doesn't match";
                          }
                        },
                        emailController: passwordController,
                        isObsecure: isObsecure,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                          icon: Icon(
                            !isObsecure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: textColorLight,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      CustomeTextField(
                      //  boarderColor: primaryColor,
                        hintText: "Re-Enter your password",
                        validator: (value) {
                          if (value == null) {
                            return "Password required";
                          }
                          if (value.length < 3) {
                            return "Password too short";
                          }
                          if (passwordController.text !=
                              rePasswordController.text) {
                            return "Password doesn't match";
                          }
                        },
                        emailController: rePasswordController,
                        isObsecure: isObsecure,
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObsecure = !isObsecure;
                            });
                          },
                          icon: Icon(
                            !isObsecure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: textColorLight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomeButton(
                        title: "Change New Password",
                        onTap: () {
                         /* if (_formKey.currentState!.validate()) {
                          } else {
                            showSnackBar(
                                context: context, content: "Something wrong");
                          }*/
                          congratulationsDialog(ctx: context).then((value){
                            passwordRestoredDialog(context);
                          });
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  passwordRestoredDialog(BuildContext context) async {

    return showDialog(
      context: context,
      barrierColor: scaffoldColor,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {

        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          content: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            width: double.maxFinite,
            // height: double.minPositive,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: EdgeInsets.all(22),
                    decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.3),
                        shape: BoxShape.circle),
                    child: Container(
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: primaryColor, shape: BoxShape.circle),
                      child: Image.asset("assets/choose_auth.png"),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                    child: Text(
                      "Password Restored",
                      style: myStyle(25,Colors.black87,FontWeight.w600),
                    )),
                Center(
                    child: Text(
                      "Your password has been restored successfully",
                      style: myStyle(14,Colors.black54,FontWeight.w400),textAlign: TextAlign.center,
                    )),
                SizedBox(
                  height: 20,
                ),
                CustomeButton(onTap: (){
                  Navigator.of(context).pushNamedAndRemoveUntil(ChooseAuth.id, (route) => false);
                }, title: "Login")


              ],
            ),
          ),
        );
      },
    );
  }
}
