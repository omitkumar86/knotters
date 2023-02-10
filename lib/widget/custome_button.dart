import 'package:flutter/material.dart';
import 'package:knotters/widget/const.dart';



class CustomeBorderButton extends StatelessWidget {
  CustomeBorderButton({
  super.key,required this.onTap,required this.title,this.paddingV,this.paddingh
  });
  final String title;
  final VoidCallback onTap;
  double? paddingV;
  double? paddingh;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text("$title",style: myStyle(16,primaryColor,FontWeight.w400),maxLines: 1,),
        padding: EdgeInsets.symmetric(vertical: paddingV??12 ,horizontal: paddingh??0 ),
        width: double.infinity,
        decoration: BoxDecoration(

            border: Border.all(
                color: primaryColor,
                width:  1
            ),
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}

class CustomeButton extends StatelessWidget {
  CustomeButton({
  super.key,this.buttonHeight,required this.onTap,required this.title
  });
  final VoidCallback onTap;
  final String title;
  double ?buttonHeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text("$title",style: myStyle(16,Colors.white,FontWeight.w400),),
        padding: EdgeInsets.symmetric(vertical:buttonHeight?? 14),
        width: double.infinity,
        height: buttonHeight,
        decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}


class AppbarButton extends StatelessWidget {
  AppbarButton({
  super.key,required this.onTap
  });

  VoidCallback ?onTap;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: onTap,
        child: CircleAvatar(
          maxRadius: 15,
          backgroundColor: Colors.white,
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
            size: 14,
          ),
        ),
      ),
    );
  }
}