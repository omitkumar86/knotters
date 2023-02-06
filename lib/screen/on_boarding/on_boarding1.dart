import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:knotters/screen/on_boarding/on_boarding2.dart';
import 'package:knotters/widget/const.dart';

class OnBoarding1 extends StatefulWidget {
  static const String id = 'OnBoarding1';

  const OnBoarding1({Key? key}) : super(key: key);

  @override
  State<OnBoarding1> createState() => _OnBoarding1State();
}

class _OnBoarding1State extends State<OnBoarding1> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    print("sssssssssssssssss");
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => OnBoarding2()),
    );
  }

  Widget _buildFullscreenImage() {
    return SvgPicture.asset("assets/onboarding.svg",
        semanticsLabel: 'A red up arrow');
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Container(
      padding: EdgeInsets.all(80),
      decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      child: SvgPicture.asset("$assetName", semanticsLabel: 'A red up arrow'),
    );
  }

  @override
  Widget build(BuildContext context) {
     var bodyStyle =myStyle(16,Colors.black54,FontWeight.w500);
    var pageDecoration = PageDecoration(

      titleTextStyle:myStyle(22,primaryColor,FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: scaffoldColor,
      imagePadding: EdgeInsets.zero,
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: IntroductionScreen(
          key: introKey,
          globalBackgroundColor: scaffoldColor,
          isProgressTap: true,
          pages: [
            PageViewModel(

              title: " ",
              body:
              "Once upon a time, Knotters was just an idea. Brought to you by youth who were once looking for opportunities to strengthen their skills. ",
              image: _buildImage('assets/onboarding.svg'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: " ",
              body:
              "Today, we are SMEs owners and we know your value, we look to work with you and grow together",
              image: _buildImage('assets/onboarding.svg'),
              decoration: pageDecoration,
            ),
            PageViewModel(
              title: "Join US !",
              body: "Lets start this journey together ",
              image: _buildImage('assets/onboarding.svg'),

              decoration: pageDecoration,
            ),
          ],
          onDone: () => _onIntroEnd(context),
          //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
          showSkipButton: true,
          skipOrBackFlex: 0,
          nextFlex: 0,
          // showBackButton: true,
          //rtl: true, // Display as right-to-left
          back: Icon(Icons.arrow_back),
          skip: Text('Skip',
              style: TextStyle(fontWeight: FontWeight.w600, color: primaryColor)),
          next: MaterialButton(
            onPressed: () {
              introKey.currentState?.next();
            },
            child: Text(
              "Next",
              style: myStyle(16, Colors.white),
            ),
            color: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          done: MaterialButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => OnBoarding2()),
              );
            },
            child: Text(
              "Done",
              style: myStyle(16, Colors.white),
            ),
            color: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          curve: Curves.fastLinearToSlowEaseIn,
          controlsMargin: const EdgeInsets.all(25),
          controlsPadding:   EdgeInsets.fromLTRB(8.0, 20.0, 8.0, 4.0),
          dotsDecorator: DotsDecorator(
            size: Size(10.0, 10.0),
            color: Color(0xFFBDBDBD),
            activeSize: Size(18.0, 10.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
          ),
          dotsContainerDecorator: const ShapeDecoration(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
          ),
        ),
      ),
    );
  }
}
