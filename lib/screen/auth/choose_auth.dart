import 'package:flutter/material.dart';
import 'package:knotters/screen/auth/sign_in/sign_in.dart';
import 'package:knotters/screen/auth/sign_up/choose_account_type.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';

class ChooseAuth extends StatefulWidget {
  static const String id = 'ChooseAuth';


  @override
  _ChooseAuthState createState() => _ChooseAuthState();
}

class _ChooseAuthState extends State<ChooseAuth> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.only(top: 0, bottom: 16, left: 16, right: 16),
          width: double.infinity,
          child: Column(

            children: [
              Expanded(
                  flex: 9,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          height: 100,width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,

                          ),
                          child:Image.asset("assets/choose_auth.png") ,
                        ),
                       Column(children: [

                         Text("SIGN IN \nTO YOUR ACCOUNT",style: myStyle(18,Colors.black,FontWeight.w900),textAlign: TextAlign.center,),
                        SizedBox(height: 6,),
                         Text("Are you already a Registered User ?",style: myStyle(16,textColorLight,FontWeight.w500),textAlign: TextAlign.center,),

                       ],),
                        Column(
                           children: [
                             CustomeButton(
                               onTap: (){
                                 Navigator.of(context).pushNamed(SignInPage.id);
                               },
                               title: "Sign in with password",
                             ),
                             SizedBox(height: 12,),
                             CustomeBorderButton(
                               title: "Create new account",
                               onTap: (){
                                 Navigator.of(context).pushNamed(ChooseAccountType.id);
                               },
                             ),
                           ],
                        ),
                      ],
                    ),
                  )),
              Padding(
                padding:   EdgeInsets.symmetric(vertical: 16,horizontal: 25),
                child: Row(
                  children: [
                    Expanded(child: Container(
                      height: .5,color: textColorLight,
                    )),
                    Text("  or  ",style: myStyle(14,textColorLight),),
                    Expanded(child: Container(
                      height: .5,color: textColorLight,
                    )),
                  ],
                ),
              ),
              Expanded(
                  flex: 5,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AuthSignupButton(
                    title: "Continue with Facebook",
                    iconData: Icons.facebook_sharp,
                    onTap: (){},
                  ),
                  AuthSignupButton(
                    title: "Continue with Google",
                    iconData: Icons.gps_off_outlined,
                    onTap: (){},
                  ), AuthSignupButton(
                    title: "Continue with Apple",
                    iconData: Icons.apple_sharp,
                    onTap: (){},
                  ),

                ],
              ),
                  ),

              ),

              SizedBox(height: 30,),

              InkWell(
                onTap: (){
                  Navigator.of(context).pushNamed(ChooseAccountType.id);
                },
                child: RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
             style:myStyle(12,textColorLight),
                    children:   <TextSpan>[
                      TextSpan(text: 'Sign up', style:myStyle(12,primaryColor)),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthSignupButton extends StatelessWidget {
  const AuthSignupButton({
    super.key, required this.title, required this.onTap, required this.iconData,
  });
  final String title;
  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            SizedBox(width: 30,),
            CircleAvatar(
              maxRadius: 12,
              backgroundColor: primaryColor,
              child: Icon(iconData,size: 16,color: Colors.white,),
            ),
            SizedBox(width: 16,),
            Text("$title",style: myStyle(16,textColorLight,FontWeight.w400),),
          ],
        ),
        padding: EdgeInsets.symmetric(vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonBackgroundColor,
            border: Border.all(
                color: primaryColor,
                width:  0.8
            ),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
