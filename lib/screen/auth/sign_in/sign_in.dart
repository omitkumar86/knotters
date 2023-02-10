import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:knotters/http/custome_http.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/screen/auth/forget_password/select_reset_type.dart';
import 'package:knotters/screen/auth/sign_up/choose_account_type.dart';
import 'package:knotters/screen/bottom_nav_bar.dart';
import 'package:knotters/utlits/utlits.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custom_TextField.dart';
import 'package:knotters/widget/custome_button.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  static const String id = 'SignInPage';

  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isObsecure = false;
  GlobalKey<FormState> _formKey = GlobalKey();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  SharedPreferences? sharedPreferences;


  getLogin() async {
    print("Start  signin");
    setState(() {
      isLoading = true;
    });
    var responce = await http.post(Uri.parse("${baseUrl}login-user"), body: {
      "email": emailController.text.toString(),
      "password": passwordController.text.toString()
    });

    print("ddddddd${responce.statusCode}");
    print("ddddddd${responce.body}");
    setState(() {
      isLoading = false;
    });
   if(responce.statusCode==200){
     var data = jsonDecode(responce.body);
     if ( data["auth_token"] != null ) {
       print("Token is ${data["auth_token"]}");
       print("user Roll type  is ${data["user"]["user_role_type"]}");
       showSnackBar(context: context, content: "Login Successfully");
       sharedPreferences = await SharedPreferences.getInstance();
       sharedPreferences!.setString("token", data["auth_token"]);
       //sharedPreferences!.setString(appAccountType, data["user"]["user_role_type"].toString());
       data["user"]["user_role_type"]== 1?Provider.of<AuthProvider>(context ,listen: false).setAccountType=true:Provider.of<AuthProvider>(context,listen: false ).setAccountType=false;

       print("${Provider.of<AuthProvider>(context,listen: false).getAccountType}");
       Navigator.of(context).pushNamedAndRemoveUntil(BottomNavBarPage.id, (route) => false);
     } else {
       showSnackBar(
           context: context, content: "Email or Password doesn't match");
     }
   }else{
     showSnackBar(
         context: context, content: "Email or Password doesn't match");
   }
  }
  AuthProvider ?authProvider;

  bool isLoading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

   // var x=Provider.of<AuthProvider>(context,listen: false).getAccountType;
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading == true,
        progressIndicator: spinkit,
        opacity: 0.5,
        blur: 0.5,
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
                          "Login to your account",
                          style: myStyle(20, Colors.black, FontWeight.w700),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomeTextField(
                          textInputAction: TextInputAction.next,
                          focusNode: emailFocusNode,
                          validator: (value) {
                            if (value == null) {
                              return "Email required";
                            }
                            if (!value.contains("@")) {
                              return "Invalid Email";
                            }
                          },
                          onEditingComplete: () {
                            FocusScope.of(context)
                                .requestFocus(passwordFocusNode);
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
                            getLogin();
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
                                  Navigator.of(context).pushReplacementNamed(
                                      ChooseAccountType.id);
                                },
                                child: RichText(
                                  text: TextSpan(
                                    text: "Don't have an account?",
                                    style: myStyle(12, textColorLight),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: ' Sign Up',
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
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            CustomeButton(
                                onTap: () {
                                  passwordFocusNode.unfocus();
                                  if (_formKey.currentState!.validate()) {
                                    getLogin();
                                  }
                                },
                                title: "Log in"),
                            MaterialButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(SelectResetType.id);
                              },
                              child: Text("Forgot the password?"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 12),
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
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  margin: EdgeInsets.only(left: 0),
                                  child: Icon(
                                    Icons.facebook_sharp,
                                    size: 20,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  margin: EdgeInsets.only(left: 20),
                                  child: Icon(Icons.abc),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool isRemember = false;
}
