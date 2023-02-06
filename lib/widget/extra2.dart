import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knotters/widget/const.dart';
import 'package:flutter_switch/flutter_switch.dart';

const TWO_PI = 3.14 * 2;

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = 100.0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Progress Indicator"),
        ),
        body:Center(
          // This Tween Animation Builder is Just For Demonstration, Do not use this AS-IS in Projects
          // Create and Animation Controller and Control the animation that way.
          child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0,end: 0.50),
            duration: Duration(seconds: 1),
            builder: (context,value,child){
              int percentage = (value*100).ceil();
              return Container(
                width: size,
                height: size,
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect){
                        return SweepGradient(
                            startAngle: 0.0,
                            endAngle: TWO_PI,
                            stops: [value,value],
                            // 0.0 , 0.5 , 0.5 , 1.0
                            center: Alignment.center,
                            colors: [primaryColor,Colors.grey.withAlpha(55)]
                        ).createShader(rect);
                      },
                      child: Container(
                        width: size,
                        height: size,

                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(image: Image.asset("assets/radial_scale.png").image)
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: size-40,
                        height: size-40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                        ),
                        child: Center(child: Text("$percentage",
                          style: TextStyle(fontSize: 25),)),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}