import 'package:flutter/material.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/screen/auth/sign_up/choose_account_type.dart';
import 'package:knotters/screen/auth/sign_up/select_country.dart';
import 'package:knotters/utlits/utlits.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';

import 'package:knotters/widget/custom_TextField.dart';
import 'package:provider/provider.dart';

class CreateEmailPassword extends StatefulWidget {
  static const String id = 'CreateEmailPassword';

  CreateEmailPassword({Key? key}) : super(key: key);

  @override
  State<CreateEmailPassword> createState() => _CreateEmailPasswordState();
}

class _CreateEmailPasswordState extends State<CreateEmailPassword> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();

  GlobalKey<FormState> _formKey=GlobalKey();
bool isObsecure=false;
@override
  void dispose() {
    // TODO: implement dispose
  emailController.dispose();
  passwordController.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AppbarButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Text(
                        "CREATE YOUR ACCOUNT",
                        style: myStyle(20, Colors.black, FontWeight.w700),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomeTextField(
                        textInputAction: TextInputAction.next,
                        focusNode: emailFocusNode,
                        validator: (value){
                          if(value==null){
                            return "Email required";
                          }
                          if(!value.contains("@")){
                            return "Invalid Email";
                          }
                        },
                        emailController: emailController,
                        hintText: "Enter your e-mail",
                        prefixIcon: Icon(
                          Icons.person_outline_outlined,
                          color: textColorLight,
                          size: 18,
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      CustomeTextField(
                        hintText: "Enter your password",
                        onEditingComplete: () {
                          passwordFocusNode.unfocus();
                        },
                        focusNode: passwordFocusNode,
                        validator: (value) {
                          if (value == null) {
                            return "Password required";
                          }
                          if (value.length < 3) {
                            return "Password too short";
                          }
                        },
                        emailController: passwordController,
                        isObsecure: isObsecure,
                        prefixIcon: Icon(
                          Icons.password_rounded,
                          color: textColorLight,
                          size: 18,
                        ),
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

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          //  mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            InkWell(
                              onTap: () {},
                              child: Checkbox(

                                activeColor: primaryColor,
                                value: isRemember,
                                onChanged: (bool? newValue) {
                                  //onChanged(newValue!);
                                  setState(() {
                                    isRemember = newValue!;
                                  });
                                },
                              ),
                            ),
                            Text(
                              "Remember me",
                              style: myStyle(12, textColorLight),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(ChooseAccountType.id);
                              },
                              child: RichText(
                                text: TextSpan(
                                  text: "Already have an account?",
                                  style: myStyle(12, textColorLight),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: ' Sign in',
                                        style: myStyle(12, primaryColor)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                          CustomeButton(onTap: () {
                            if(_formKey.currentState!.validate()){
                              authProvider.setEmail=emailController.text.toString();
                              authProvider.setPassword=passwordController.text.toString();
                              Navigator.of(context)
                                  .pushNamed(SelectCountry.id);
                           }else{
                             showSnackBar(context: context, content:"E-mail and Password required");
                           }

                          },
                              title: "Sign Up"),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 12),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                          height: .5,
                                          color: textColorLight,
                                        )),
                                    Text(
                                      "  Or Continue with  ",
                                      style: myStyle(16, textColorLight),
                                    ),
                                    Expanded(
                                        child: Container(
                                          height: .5,
                                          color: textColorLight,
                                        )),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    margin: EdgeInsets.only(left: 0),
                                    child: Icon(Icons.facebook_sharp),
                                  ),

                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    margin: EdgeInsets.only(left: 20),
                                    child: Icon(Icons.facebook_sharp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          InkWell(
                            onTap: () {

                            },
                            child: RichText(
                              text: TextSpan(
                                text: "Don't have an account? ",
                                style: myStyle(12, textColorLight),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Sign up',
                                      style: myStyle(12, primaryColor)),
                                ],
                              ),
                            ),
                          ),
                        ],

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isRemember = false;
}



