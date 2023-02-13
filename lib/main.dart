import 'dart:io';

import 'package:flutter/material.dart';
import 'package:knotters/miscellaneous_screen/news_and_event_page.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/provider/gig_provider.dart';
import 'package:knotters/provider/student_profile_provider.dart';
import 'package:knotters/screen/auth/choose_auth.dart';
import 'package:knotters/screen/auth/forget_password/add_reset_otp_page.dart';
import 'package:knotters/screen/auth/forget_password/create_new_password.dart';
import 'package:knotters/screen/auth/forget_password/select_reset_type.dart';
import 'package:knotters/screen/auth/sign_in/sign_in.dart';
import 'package:knotters/screen/auth/sign_up/add_auth_info2.dart';
import 'package:knotters/screen/auth/sign_up/add_buisness_details.dart';
import 'package:knotters/screen/auth/sign_up/add_education.dart';
import 'package:knotters/screen/auth/sign_up/add_personal_info.dart';
import 'package:knotters/screen/auth/sign_up/add_skills.dart';
import 'package:knotters/screen/auth/sign_up/choose_account_type.dart';
import 'package:knotters/screen/auth/sign_up/create_email_password.dart';
import 'package:knotters/screen/auth/sign_up/select_country.dart';
import 'package:knotters/screen/bottom_nav_bar.dart';
import 'package:knotters/screen/gig/create_gig.dart';
import 'package:knotters/screen/nav_bar/community.dart';
import 'package:knotters/screen/nav_bar/sme_gigs.dart';
import 'package:knotters/screen/nav_bar/growth.dart';
import 'package:knotters/screen/on_boarding/on_boarding1.dart';
import 'package:knotters/screen/on_boarding/on_boarding2.dart';
import 'package:knotters/screen/on_boarding/on_boarding3.dart';
import 'package:knotters/screen/on_boarding/splash_screen.dart';
import 'package:knotters/screen/profile/students_profile.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/extra.dart';
import 'package:knotters/widget/extra2.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthProvider authProvider = AuthProvider();
  @override
  void initState() {
   // getAccountType();
    super.initState();
  }

  //Fetch the current theme
  void getAccountType() async {
    authProvider.setAccountType =
    await authProvider.appAccountType.getAccountType();
  }
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {  return authProvider;}),
        ChangeNotifierProvider(create: (_) {  return StudentProfileProvider();}),
        ChangeNotifierProvider(create: (_) {  return GigProvider();}),

      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
              primaryColor: primaryColor,
              errorColor: primaryColor,
              scaffoldBackgroundColor: scaffoldColor,
              primarySwatch: Colors.blue,

              appBarTheme: AppBarTheme(color: scaffoldColor, elevation: 0)),
          debugShowCheckedModeBanner: false,
          routes: {
            SplashScreen.id: (context) => SplashScreen(),
            AddPersonalInfo2.id: (context) => AddPersonalInfo2(),
            OnBoarding1.id: (context) => OnBoarding1(),
            OnBoarding2.id: (context) => OnBoarding2(),
            OnBoarding3.id: (context) => OnBoarding3(),
            ChooseAuth.id: (context) => ChooseAuth(),
            SelectCountry.id: (context) => SelectCountry(),
            AddPersonalInfo.id: (context) => AddPersonalInfo(),
            AddYourSkills.id: (context) => AddYourSkills(),
            AddEducation.id: (context) => AddEducation(),
            ChooseAccountType.id: (context) => ChooseAccountType(),
            AddBuisnessDetails.id: (context) => AddBuisnessDetails(),
            SignInPage.id: (context) => SignInPage(),
            CreateEmailPassword.id: (context) => CreateEmailPassword(),
            SelectResetType.id: (context) => SelectResetType(),
            AddResetOtpPage.id: (context) => AddResetOtpPage(),
            CreateNewPassword.id: (context) => CreateNewPassword(), 
            CommunityPage.id: (context) => CommunityPage(),
           // ProfilePage.id: (context) => ProfilePage(),
            SmeGigsPage.id: (context) => SmeGigsPage(),
            GrowthPage.id: (context) => GrowthPage(),
            CreateGigPage.id: (context) => CreateGigPage(),
            BottomNavBarPage.id: (context) => BottomNavBarPage(),
          },
          home: NewsAndEventPage()),
    );
  }
}
//..


// karwanbazar,