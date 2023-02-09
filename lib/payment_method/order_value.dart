import 'package:flutter/material.dart';
import 'package:knotters/screen/profile/students_profile_page.dart';
import 'package:knotters/widget/const.dart';

class PaymentOrderValue extends StatefulWidget {
  const PaymentOrderValue({Key? key}) : super(key: key);

  @override
  State<PaymentOrderValue> createState() => _PaymentOrderValueState();
}

class _PaymentOrderValueState extends State<PaymentOrderValue> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
            Container(
            margin: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ORDER VALUE", style: myStylePaymentHeader(),),
                SizedBox(height: 15,),
                Text("Order Amount", style: myStylePoppins(12),),
                SizedBox(height: 10,),
              Container(
                alignment: Alignment.centerLeft,
                width: double.infinity,
                height: 35,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: borderColor),
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Text("\$50", style: myStylePoppins(14, Colors.black),),),
                SizedBox(height: 20,),
                Text("Payment to", style: myStylePoppins(12),),
                SizedBox(height: 10,),
                Container(
                  height: 75,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      border: Border.all(color: primaryColor.withOpacity(0.3)),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: ListTile(
                    leading: CircleContainer(
                      height: 40,
                      width: 40,
                      widget: Center(
                        child: Text("R"),
                      ),
                    ),
                    title: Text("Khalid Bin Walid", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                    subtitle: Text("Graphics Designer", style: myStyle(12, textColorLight, FontWeight.normal),),
                    trailing: Icon(Icons.arrow_forward_ios, size: 10, color: primaryColor,),
                  ),
                ),
              ],
            ),),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 50),
                  child: continueButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
