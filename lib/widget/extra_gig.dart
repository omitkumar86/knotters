import 'package:flutter/material.dart';
import 'package:knotters/screen/profile/students_profile_page.dart';
import 'package:knotters/widget/const.dart';

class ExtraGig extends StatefulWidget {
  const ExtraGig({Key? key}) : super(key: key);

  @override
  State<ExtraGig> createState() => _ExtraGigState();
}

class _ExtraGigState extends State<ExtraGig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonContainer(
              context: context,
              radius: 5,
              widget: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: secondaryColor),
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 5,),
                            Text("Graphics designer for event", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                          ],
                        ),
                        ContainerWithContraints(
                          widget: Text("\$50", style: myStyle(13, secondaryColorDark, FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                      style: myStyle(11, textColorLight, FontWeight.normal),),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BorderButton(
                          onTap: ((){}),
                          title: Text("Graphic Design",style: myStyle(10,textColorLight,FontWeight.w400),),
                          height: 30,
                          width: 70,
                        ),
                        BorderButton(
                          onTap: ((){}),
                          title: Text("8 Days",style: myStyle(10,textColorLight,FontWeight.w400),),
                          height: 30,
                          width: 50,
                        ),
                        BorderButton(
                          onTap: ((){}),
                          title: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.location_on, color: textColorLight, size: 12,),
                              Text("Abu Dhabi",style: myStyle(10,textColorLight,FontWeight.w400),),
                            ],
                          ),
                          height: 30,
                          width: 60,
                        ),
                        BorderButton(
                          onTap: ((){}),
                          title: Text("Single Gig",style: myStyle(10,textColorLight,FontWeight.w400),),
                          height: 30,
                          width: 60,
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      height: 32,
                      width: MediaQuery.of(context)
                          .size
                          .width -
                          5,
                      child: InkWell(
                        onTap: (() {}),
                        child: Container(

                          alignment: Alignment.center,
                          child: Text(
                            "Apply to the Gig",
                            style: myStyle(
                                14,
                                Colors.white,
                                FontWeight.w400),
                          ),
                          padding:
                          EdgeInsets.symmetric(
                              vertical: 3),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius:
                              BorderRadius
                                  .circular(8)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
