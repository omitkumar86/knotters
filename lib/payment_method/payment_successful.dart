import 'package:flutter/material.dart';
import 'package:knotters/widget/const.dart';

class PaymentSuccessfulPage extends StatefulWidget {
  const PaymentSuccessfulPage({Key? key}) : super(key: key);

  @override
  State<PaymentSuccessfulPage> createState() => _PaymentSuccessfulPageState();
}

class _PaymentSuccessfulPageState extends State<PaymentSuccessfulPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 110,
                      width: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primaryColor,
                      ),
                      child: Icon(
                        Icons.attach_money_outlined,
                        color: primaryWhite,
                        size: 35,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "SUCCESS !",
                      style: myStylePaymentHeader(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "You have successfully added \$50 to your Wallet",
                      style: myStylePoppins(15, textColorLight),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 46,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: primaryColor.withOpacity(0.3)),
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: Text(
                          "See available balance",
                          style: myStyle(15, primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
