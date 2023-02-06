import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knotters/screen/on_boarding/on_boarding3.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';


class OnBoarding2 extends StatelessWidget {
  static const String id = 'OnBoarding2';
  const OnBoarding2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height *0.30,
                    child: SvgPicture.asset("assets/onboarding.svg", semanticsLabel: 'A red up arrow')),
                SizedBox(height: 30,),
                Text("Active notifications to stay up to date with the latest gigs!",style: myStyle(20,Colors.black87,FontWeight.w700),textAlign: TextAlign.center,)
                ,SizedBox(height: 12,)
                ,Text("Don't miss out on any new gigs by activating your notifications! (we promise not to spam you )",style: myStyle(16,textColorLight,FontWeight.w400),textAlign: TextAlign.center,),

              ],
            ),

            Column(
              children: [
                Text("Knotters would like to send you notification about news, articles, and updated task",style: myStyle(16,primaryColor,FontWeight.w700),textAlign: TextAlign.center,),
                SizedBox(height: 35,),
                CustomeButton(onTap: (){
                  Navigator.of(context).pushReplacementNamed(OnBoarding3.id);
                }, title:"Yes, Allow"),
                TextButton(onPressed: (){
                  Navigator.of(context).pushReplacementNamed(OnBoarding3.id);
                }, child: Text("No, Don't",style: myStyle(16,Colors.black54),))
              ],
            )

          ],
        ),
      ),
    );
  }
}
