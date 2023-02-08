import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';



final primaryColor = Color(0xFFFD7F51);
final primaryColorLight = Color(0xFFFCCAB7);
final scaffoldColor = Color(0xFFEFEDE4);
final secondaryColor = Color(0xFFE5E4E4);
final secondaryColorDark = Color(0xFF232323);
final buttonBackgroundColor = Color(0xFFEBEBEB);
final textColorLight = Color(0xFF979793);
final primaryWhite = Colors.white;


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
        color: index.isEven ? primaryColor : primaryColorLight,
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