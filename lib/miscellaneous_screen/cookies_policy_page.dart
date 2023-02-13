import 'package:flutter/material.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/const_string.dart';
import 'package:knotters/widget/custome_button.dart';

class CookiesPolicyPage extends StatelessWidget {
  const CookiesPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: AppBar(
          backgroundColor: primaryWhite,
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: AppbarButton(onTap: (){
              Navigator.of(context).pop();
            }),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cookies Policy", style: myStylePoppins(16, primaryColor),),
                      Divider(),
                      SizedBox(height: 10,),
                      Text("1. Types of Cookies We Collect", style: myStylePoppins(13, primaryBlack, FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text(typeOfData, style: myStylePoppins(10, primaryBlack), textAlign: TextAlign.justify,),
                      SizedBox(height: 15,),
                      Text("2. Use of your Personal Data", style: myStylePoppins(13, primaryBlack, FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text(typeOfData, style: myStylePoppins(10, primaryBlack), textAlign: TextAlign.justify,),
                      SizedBox(height: 15,),
                      Text("3. Discloser of your Personal Data", style: myStylePoppins(13, primaryBlack, FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text(typeOfData, style: myStylePoppins(10, primaryBlack), textAlign: TextAlign.justify,),
                      SizedBox(height: 15,),
                      Text("4. Data we do not collect", style: myStylePoppins(13, primaryBlack, FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text(typeOfData, style: myStylePoppins(10, primaryBlack), textAlign: TextAlign.justify,),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
