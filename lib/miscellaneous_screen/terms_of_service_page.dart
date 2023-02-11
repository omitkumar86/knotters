import 'package:flutter/material.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/const_string.dart';
import 'package:knotters/widget/custome_button.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        appBar: AppBar(
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
                      Text("Terms & Conditions", style: myStylePoppins(16, primaryColor),),
                      Text("updated at 2022-08-06", style: myStylePoppins(8, textColorLight),),
                      Divider(),
                      SizedBox(height: 10,),
                      Text("General Terms", style: myStylePoppins(13, primaryBlack, FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text(typeOfData, style: myStylePoppins(10, primaryBlack), textAlign: TextAlign.justify,),
                      SizedBox(height: 15,),
                      Text("Selling & Buying", style: myStylePoppins(13, primaryBlack, FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text(typeOfData, style: myStylePoppins(10, primaryBlack), textAlign: TextAlign.justify,),
                      SizedBox(height: 15,),
                      Text("Definitions & Key Terms", style: myStylePoppins(13, primaryBlack, FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text(typeOfData, style: myStylePoppins(10, primaryBlack), textAlign: TextAlign.justify,),
                      SizedBox(height: 15,),
                      Text("Payments", style: myStylePoppins(13, primaryBlack, FontWeight.w500),),
                      SizedBox(height: 10,),
                      Text(typeOfData, style: myStylePoppins(10, primaryBlack), textAlign: TextAlign.justify,),
                      SizedBox(height: 15,),
                      Text("Restrictions", style: myStylePoppins(13, primaryBlack, FontWeight.w500),),
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
