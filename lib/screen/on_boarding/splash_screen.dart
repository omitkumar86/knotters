import 'package:flutter/material.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/screen/auth/choose_auth.dart';
import 'package:knotters/screen/auth/sign_up/choose_account_type.dart';
import 'package:knotters/screen/bottom_nav_bar.dart';
import 'package:knotters/screen/on_boarding/on_boarding1.dart';
import 'package:knotters/widget/const.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'SplashScreen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  isLoggedIn()async{
    SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
    var token=sharedPreferences.getString("token");
    var accountType=sharedPreferences.getBool(appAccountTypeToken);
    if(token!=null){
      Provider.of<AuthProvider>(context,listen: false).setToken=token;
      accountType ==false?Provider.of<AuthProvider>(context ,listen: false).setAccountType=false:Provider.of<AuthProvider>(context,listen: false ).setAccountType=true;
     print("Account type is${Provider.of<AuthProvider>(context,listen: false).getAccountType}");
     print("Account Token is${Provider.of<AuthProvider>(context,listen: false).getToken}");
      Navigator.of(context).pushNamedAndRemoveUntil(BottomNavBarPage.id, (route) => false);
      //Navigator.of(context).pushNamedAndRemoveUntil(ChooseAuth.id, (route) => false);
    }else{
      Future.delayed(Duration(milliseconds: 1000),(){
        Navigator.of(context).pushReplacementNamed(OnBoarding1.id);
      });
    }
  }


  @override
  void initState() {
    // TODO: implement initState
 // isLoggedIn();
   Future.delayed(Duration(milliseconds: 1000),(){
   //  Navigator.of(context).pushReplacementNamed(ChooseAuth.id);
    isLoggedIn();
   });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff06060B),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/knotters_logo_white.png"),
            SizedBox(
              height: 16,
            ),
            Text("The first of its kind in the UAE",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic)),
            SizedBox(
              height: 35,
            ),
            
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Text("COUNTLESS GIGS POWRED BY TALENTED YOUTH .",style: myStyle(18,Colors.white,FontWeight.w600),textAlign: TextAlign.center,),
            ),
            SizedBox(
              height: 100,
            ),

            spinkit
          ],
        ),
      ),
    );
  }
}
