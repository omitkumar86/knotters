// ignore_for_file: sort_child_properties_last

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/screen/gig/create_gig.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';
import 'package:provider/provider.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class CommunityPage extends StatefulWidget {
  static const String id = 'CommunityPage';

  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final List<String> imgList = [
    "https://smartslider3.com/wp-content/uploads/2018/07/layerSldier.jpg",
    "https://smartslider3.com/wp-content/uploads/2019/05/sliderimages-780x410.png",
    "https://smartslider3.com/wp-content/uploads/2018/07/layerSldier.jpg",
    "https://smartslider3.com/wp-content/uploads/2019/05/sliderimages-780x410.png",
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isSME = Provider.of<AuthProvider>(context).getAccountType;
   // print("is Emeeee is $isSME");
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "HALA SARA!",
                          style: myStyle(25, Colors.black, FontWeight.w800),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "Are you ready to start!",
                          style: myStyle(18, Colors.black54, FontWeight.w500),
                        ),
                      ],
                    ),
                  /*  Container(
                      padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(color: primaryColor, width: 1),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlutterSwitch(
                            width: 45.0,
                            height: 20.0,
                            toggleSize: 20.0,
                            value: isSME,
                            borderRadius: 16.0,
                            padding: 2.0,
                            toggleColor: primaryColor,
                            switchBorder: Border.all(
                              color: primaryColor,
                              width: 1.5,
                            ),
                            toggleBorder: Border.all(
                              color: primaryColor,
                              width: 2.0,
                            ),
                            activeColor: Colors.white,
                            inactiveColor: Colors.white,
                            onToggle: (val) {
                              setState(() {
                                isSME = val;
                              });
                            },
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 6),
                            alignment: Alignment.centerRight,
                            child: Text(
                              isSME ? "SME" : "STUDENT",
                              style:
                                  myStyle(12, Colors.black54, FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                    )*/
                  ],
                ),
              ),
              CarouselSlider.builder(
                  options: CarouselOptions(
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                      height: size.height * 0.17,
                      autoPlay: true,
                      viewportFraction: 1),
                  itemCount: imgList.length,
                  itemBuilder:
                      (BuildContext context, int index, int pageViewIndex) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Stack(
                        children: [
                          FancyShimmerImage(
                            boxFit: BoxFit.cover,
                            errorWidget: Image.asset(
                              'assets/cat_image.jpg',
                              width: double.infinity,
                              height: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            imageUrl: "${imgList[index]}",
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imgList.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () =>
                                      _controller.animateToPage(entry.key),
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Colors.white
                                                : Colors.black)
                                            .withOpacity(_current == entry.key
                                                ? 0.9
                                                : 0.4)),
                                  ),
                                );
                              }).toList(),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  "Statistics",
                  style: myStyle(18, Colors.black, FontWeight.w700),
                ),
              ),
              SizedBox(
                height: size.height * 0.13,
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.only(right: 6),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: SleekCircularSlider(
                          innerWidget: (double val) {
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${2568}"),
                                Text(
                                  "Students",
                                  style: myStyle(
                                      12, primaryColor, FontWeight.w700),
                                ),
                              ],
                            ));
                          },
                          appearance: CircularSliderAppearance(
                            angleRange: 350,
                            //spinnerMode: true,

                            customColors: CustomSliderColors(
                                //  hideShadow: true,
                                // dotColor: Colors.red,
                                trackColor: primaryColor,
                                progressBarColor: primaryColor),
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 8,
                                shadowWidth: 10,
                                trackWidth: 0,
                                handlerSize: 2),
                          ),
                          min: 0,
                          max: 100,
                          initialValue: 60,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.only(right: 6),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: SleekCircularSlider(
                          innerWidget: (double val) {
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${5820}"),
                                Text(
                                  "SME'S",
                                  style: myStyle(
                                      12, primaryColor, FontWeight.w700),
                                ),
                              ],
                            ));
                          },
                          appearance: CircularSliderAppearance(
                            angleRange: 350,
                            //spinnerMode: true,

                            customColors: CustomSliderColors(
                                //  hideShadow: true,
                                // dotColor: Colors.red,
                                trackColor: primaryColor,
                                progressBarColor: primaryColor),
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 8,
                                shadowWidth: 10,
                                trackWidth: 0,
                                handlerSize: 2),
                          ),
                          min: 0,
                          max: 100,
                          initialValue: 60,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: EdgeInsets.only(right: 6),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: SleekCircularSlider(
                          innerWidget: (double val) {
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("45862"),
                                Text(
                                  "GIGS",
                                  style: myStyle(
                                      12, primaryColor, FontWeight.w700),
                                ),
                              ],
                            ));
                          },
                          appearance: CircularSliderAppearance(
                            angleRange: 350,
                            //spinnerMode: true,

                            customColors: CustomSliderColors(
                                //  hideShadow: true,
                                // dotColor: Colors.red,
                                trackColor: primaryColor,
                                progressBarColor: primaryColor),
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 8,
                                shadowWidth: 10,
                                trackWidth: 0,
                                handlerSize: 2),
                          ),
                          min: 0,
                          max: 100,
                          initialValue: 60,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: SleekCircularSlider(
                          innerWidget: (double val) {
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${val.toInt()}"),
                                Text(
                                  "SATISFACTION",
                                  style: myStyle(
                                      10, primaryColor, FontWeight.w700),
                                ),
                              ],
                            ));
                          },
                          appearance: CircularSliderAppearance(
                            angleRange: 350,
                            //spinnerMode: true,

                            customColors: CustomSliderColors(
                                //  hideShadow: true,
                                // dotColor: Colors.red,
                                trackColor: primaryColor,
                                progressBarColor: primaryColor),
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 8,
                                shadowWidth: 10,
                                trackWidth: 0,
                                handlerSize: 2),
                          ),
                          min: 0,
                          max: 100,
                          initialValue: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  //  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "KAFO WALL",
                        style: myStyle(18, Colors.black, FontWeight.w700),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        height: size.height * 0.13,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Container(
                              width: 100,
                              margin: EdgeInsets.only(right: 12),
                              child: Text(
                                "",
                                style:
                                    myStyle(18, Colors.black, FontWeight.w700),
                              ),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      width: 2, color: primaryColorLight)),
                            );
                          },
                        ),
                      ),
                    ],
                  )),
              Visibility(
                visible: isSME == false,
                child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    //  width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "POST YOUR REQUIREMENTS",
                          style: myStyle(18, Colors.black, FontWeight.w700),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child:
                              CustomeButton(onTap: () {
                                Navigator.pushNamed(context, CreateGigPage.id );
                              }, title: " Post a Gig"),
                        ),
                      ],
                    )),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  //  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "HAPPENING NOW",
                            style: myStyle(18, Colors.black, FontWeight.w700),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.keyboard_arrow_down))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "[X company] just posted a [voice over gig !]",
                            style: myStyle(12, Colors.black54, FontWeight.w700),
                          ),
                          Text(
                            "23 sec sgo",
                            style: myStyle(12, Colors.black54, FontWeight.w700),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black54,
                        thickness: 0.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "[X company] just posted a [voice over gig !]",
                            style: myStyle(12, Colors.black54, FontWeight.w700),
                          ),
                          Text(
                            "23 sec sgo",
                            style: myStyle(12, Colors.black54, FontWeight.w700),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black54,
                        thickness: 0.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "[X company] just posted a [voice over gig !]",
                            style: myStyle(12, Colors.black54, FontWeight.w700),
                          ),
                          Text(
                            "23 sec sgo",
                            style: myStyle(12, Colors.black54, FontWeight.w700),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black54,
                        thickness: 0.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "[X company] just posted a [voice over gig !]",
                            style: myStyle(12, Colors.black54, FontWeight.w700),
                          ),
                          Text(
                            "23 sec sgo",
                            style: myStyle(12, Colors.black54, FontWeight.w700),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black54,
                        thickness: 0.0,
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }


}
