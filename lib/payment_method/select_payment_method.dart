import 'package:flutter/material.dart';
import 'package:knotters/screen/profile/students_profile_page.dart';
import 'package:knotters/widget/const.dart';

class SelectPaymentMethod extends StatefulWidget {
  const SelectPaymentMethod({Key? key}) : super(key: key);

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
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
                      Text("SELECT PAYMENT METHOD", style: myStylePaymentHeader(),),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 47,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: borderColor),
                              color: primaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.account_balance_wallet, color: primaryWhite, size: 16,),
                                  SizedBox(width: 10,),
                                  Text("My Wallet", style: myStyle(14, primaryWhite, FontWeight.w600),),
                                ],
                              ),
                              Row(
                                children: [
                                  Text("Balance \$254", style: myStyle(14, primaryWhite, FontWeight.w600),),
                                  SizedBox(width: 10,),
                                  customRadioButton(),
                                ],
                              )
                            ],
                          )),
                      ),
                      SizedBox(height: 8,),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 47,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: borderColor),
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.apple_outlined, color: primaryBlack, size: 16,),
                                  SizedBox(width: 10,),
                                  Text("Apple Pay", style: myStyle(14, primaryBlack, FontWeight.w600),),
                                ],
                              ),
                              Row(
                                children: [
                                  customRadioButton(),
                                ],
                              )
                            ],
                          )),
                      ),
                      SizedBox(height: 8,),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 47,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                              border: Border.all(color: borderColor),
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.credit_card, color: primaryBlack, size: 16,),
                                  SizedBox(width: 10,),
                                  Text("Master Card ", style: myStyle(14, primaryBlack, FontWeight.w600),),
                                  Text(" 2545 854* ****", style: myStyle(10, textColorLight, FontWeight.w600),),
                                ],
                              ),
                              Row(
                                children: [
                                  customRadioButton(),
                                ],
                              )
                            ],
                          )),
                      ),

                      SizedBox(height: 30,),
                      Text("ADD NEW CARD", style: myStylePaymentHeader(),),
                      SizedBox(height: 10,),
                      InkWell(
                        onTap: (){},
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor.withOpacity(0.3)),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                height: 24,
                                width: 24,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.add, color: primaryWhite, size: 12,),
                              ),
                              SizedBox(width: 10,),
                              Text("Add New Card", style: myStyle(14, textColorLight, FontWeight.w600),),
                            ],
                          ),
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
