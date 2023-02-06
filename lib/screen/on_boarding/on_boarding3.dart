import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knotters/screen/auth/choose_auth.dart';
import 'package:knotters/widget/const.dart';


class OnBoarding3 extends StatefulWidget {
  static const String id = 'OnBoarding3';

  @override
  State<OnBoarding3> createState() => _OnBoarding3State();
}

class _OnBoarding3State extends State<OnBoarding3> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(milliseconds: 1200),(){
      Navigator.of(context).pushReplacementNamed(ChooseAuth.id);
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            height: 200,width: 200,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withOpacity(0.3),
              shape: BoxShape.circle
            ),
            child:  Container(
                height: 200,width: 200,
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(

                    color: primaryColor ,
                    shape: BoxShape.circle

                ),child:  Image.asset("assets/choose_auth.png"),

            ),
          ),

           Container(
             margin: EdgeInsets.symmetric(vertical: 25),
             height: 40,
             width: 200,
             child:  Image.asset("assets/knotters_logo_black.png",  ),
           ),
            Text("Thanx for watching, this is taking a bit longer than expected. Hand in there ! We're almost done",style: myStyle(14,textColorLight,FontWeight.w400),textAlign: TextAlign.center,)
          ,
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
