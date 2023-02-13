

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:knotters/miscellaneous_screen/cookies_policy_page.dart';
import 'package:knotters/miscellaneous_screen/news_and_event_page.dart';
import 'package:knotters/miscellaneous_screen/privacy_policy_page.dart';
import 'package:knotters/miscellaneous_screen/terms_of_service_page.dart';
import 'package:knotters/miscellaneous_screen/trust_and_safety_page.dart';
import 'package:knotters/screen/auth/choose_auth.dart';



final primaryColor = Color(0xFFFD7F51);
final primaryColorLight = Color(0xFFFCCAB7);
final scaffoldColor = Color(0xFFEFEDE4);
final secondaryColor = Color(0xFFE5E4E4);
final secondaryColorDark = Color(0xFF232323);
final buttonBackgroundColor = Color(0xFFEBEBEB);
final textColorLight = Color(0xFF979793);
final primaryWhite = Colors.white;
final borderColor = Color(0xffD5D5D5);
final primaryBlack = Colors.black;


myStyle (double size,[Color? color,FontWeight ?fw]){
  return GoogleFonts.anekMalayalam(
      fontSize: size,
      color: color,
      fontWeight: fw,
      height: 1.1
  );
}myStylePoppins (double size,[Color? color,FontWeight ?fw]){
  return GoogleFonts.poppins(
    fontSize: size,
    color: color,
    fontWeight: fw,
    height: 1.1,
  );
}

myStyleHeader ( ){
  return GoogleFonts.anekMalayalam(
      fontSize: 22,
      color: Colors.black87,
      fontWeight: FontWeight.w700,
      height: 1.1
  );
}myStyleBody ( ){
  return GoogleFonts.anekMalayalam(
      fontSize: 14,
      color: textColorLight,
      fontWeight: FontWeight.w600,
      height: 1.1
  );
}myStylePaymentHeader ( ){
  return GoogleFonts.anekMalayalam(
      fontSize: 20,
      color: Colors.black,
      fontWeight: FontWeight.w600,
      height: 1.1,
      wordSpacing: 1.1,
      letterSpacing: 1
  );
}

SizedBox buildContainer({IconButton? iconButton, double? radius, Color? color, double? sbHeight, double? sbWidth,}) {
  return SizedBox(
    height: sbHeight,
    width: sbWidth,
    child: Container(
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(radius!))
      ),
      child: Align(
        alignment: Alignment.center,
        child: iconButton,
      ),
    ),
  );
}


final spinkit = SpinKitFadingCircle(
//  controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryColor,
      ),
    );
  },
);


congratulationsDialog({BuildContext ?ctx, String? title, subTitle}) async {

  return showDialog(
    context: ctx!,
    // barrierColor: scaffoldColor,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {

      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        content: Container(
          height: MediaQuery.of(context).size.height * 0.20,
          width: double.maxFinite,
          // height: double.minPositive,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                  child: CircleAvatar(
                      backgroundColor: primaryColor,
                      child: Icon(Icons.done_rounded,color: Colors.white,))),
              SizedBox(
                height: 8,
              ),
              Center(
                  child: Text(
                    title?? "Congratulations",
                    style: myStyle(16,Colors.black87,FontWeight.w600),
                  )),

              Center(
                  child: Text(
                    subTitle?? "Welcome to the Knotter Platform",
                    style: myStyle(12,Colors.black54,FontWeight.w400),textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 20,
              ),


            ],
          ),
        ),
      );
    },
  );
}

continueButton(){
  return SizedBox(
    height: 49,
    width: double.maxFinite,
    child: InkWell(
      onTap: (() {

      }),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          "Continue",
          style: myStyle(
              16,
              Colors.white,
              FontWeight.w400),
        ),
        padding:
        EdgeInsets.symmetric(
            vertical: 3),
        width: double.infinity,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius:
            BorderRadius
                .circular(8)),
      ),
    ),
  );
}

customRadioButton(){
  return Container(
    padding: EdgeInsets.all(1),
    height: 15,
    width: 15,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: borderColor),
    ),
    child: Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: primaryWhite,
      ),
    ),
  );
}

customLogoutFunction(BuildContext context){
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.topCenter,
          content: Container(
            width: double.maxFinite,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10),
                    child: Text(
                      "About our platform",
                      style: myStylePoppins(14,
                          primaryColor, FontWeight.w500),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PrivacyPolicyPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(5),
                        //color: primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Privacy Policy",
                            style: myStylePoppins(
                                14, secondaryColorDark),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CookiesPolicyPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(5),
                        //color: primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Cookies Policy",
                            style: myStylePoppins(
                                14, secondaryColorDark),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TermsOfServicePage()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(5),
                        //color: primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Terms of service",
                            style: myStylePoppins(
                                14, secondaryColorDark),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TrustAndSafetyPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(5),
                        //color: primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Trust & Safety",
                            style: myStylePoppins(
                                14, secondaryColorDark),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewsAndEventPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(5),
                        //color: primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "News & Events",
                            style: myStylePoppins(
                                14, secondaryColorDark),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: primaryColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      logoutAlert(context);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(5),
                        color: primaryColor,
                      ),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Log Out",
                            style: myStylePoppins(
                                14, primaryWhite),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 10,
                            color: primaryWhite,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        );
      });
}

logoutAlert(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          alignment: Alignment.center,
          content: Container(
            width: double.maxFinite,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 10),
                    child: Text(
                      "Log Out",
                      style: myStylePoppins(14,
                          primaryColor, FontWeight.w500),
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 10,),
                  Text("Are you sure you want to log out of your account", style: myStylePoppins(12, primaryBlack),
                  textAlign: TextAlign.center,),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.center,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor.withOpacity(0.3)),
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Text("No Thanks", style: myStylePoppins(12, textColorLight),),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>ChooseAuth()), (route) => false);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 28),
                          alignment: Alignment.center,
                          height: 30,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Text("Log Out", style: myStylePoppins(12, primaryWhite),),
                        ),
                      ),
                    ],
                  )
                ]),
          ),
        );
      });
}