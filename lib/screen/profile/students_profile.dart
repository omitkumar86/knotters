
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:instagram_mention/instagram_mention.dart';
import 'package:knotters/widget/const.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../provider/auth_provider.dart';
import '../../widget/custome_button.dart';


class StudentsProfile extends StatefulWidget {
  static const String id = 'StudentsProfile';
  const StudentsProfile({Key? key}) : super(key: key);

  @override
  State<StudentsProfile> createState() => _StudentsProfileState();
}

class _StudentsProfileState extends State<StudentsProfile> with TickerProviderStateMixin {

  /// bottom bar
  int selectedItem=0;

  /// tab
  TabController? _tabController;
  TabController? _projectDocController;
  int selectedTabIndex = 0;
  int selectedProjectDocTabIndex = 0;
  var _scrollViewController;

  /// slider
  double _currentSliderValue = 20;

  @override
  void initState() {
    pageController = PageController(initialPage: selectedItem);
    _scrollViewController = ScrollController();
    _tabController = TabController(length: 4, vsync: this);
    _projectDocController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  PageController? pageController;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       flex: 1,
                  //       child: Row(
                  //         children: [
                  //           AppbarButton(onTap: () {
                  //             Navigator.of(context).pop();
                  //           }),
                  //           SizedBox(width: 8,),
                  //           Padding(
                  //             padding: EdgeInsets.only(top:4),
                  //             child: Text(
                  //               "PROFILE",
                  //               style: myStyle(27, Colors.black87, FontWeight.w700),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     Expanded(
                  //         flex: 1,
                  //         child: Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           crossAxisAlignment: CrossAxisAlignment.center,
                  //           children: [
                  //             IconButton(
                  //               onPressed: (() {}),
                  //               icon: Icon(Icons.share_outlined, size: 20,),
                  //             ),
                  //             buildContainer(
                  //                 iconButton: IconButton(
                  //                   padding: EdgeInsets.zero,
                  //                   onPressed: (() {}),
                  //                   icon: const Icon(Icons.search_outlined, size: 18,),
                  //                 ),
                  //                 radius: 30,
                  //                 color: secondaryColor,
                  //                 sbHeight: 35,
                  //                 sbWidth: 35
                  //             ),
                  //             buildContainer(
                  //                 iconButton: IconButton(
                  //                   padding: EdgeInsets.zero,
                  //                   onPressed: (() {}),
                  //                   icon: Icon(Icons.notifications_none, size: 18,),
                  //                 ),
                  //                 radius: 30,
                  //                 color: secondaryColor,
                  //                 sbHeight: 35,
                  //                 sbWidth: 35
                  //             ),
                  //             SizedBox(
                  //                 height: 35,
                  //                 width: 35,
                  //                 child: buildContainer(
                  //                     iconButton: IconButton(
                  //                       padding: EdgeInsets.zero,
                  //                       onPressed: (() {}),
                  //                       icon: const Icon(Icons.search_outlined, size: 18,),
                  //                     ),
                  //                     radius: 30,
                  //                     color: secondaryColor,
                  //                     sbHeight: 35,
                  //                     sbWidth: 35
                  //                 )
                  //             ),
                  //           ],
                  //         )
                  //     ),
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        padding: EdgeInsets.all(15),
                        constraints: BoxConstraints(
                          minHeight: MediaQuery.of(context).size.height - 220,
                          minWidth: MediaQuery.of(context).size.width - 5,
                          maxHeight: double.infinity,
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Settings
                                buildContainer(
                                    iconButton: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: (() {}),
                                      icon: const Icon(Icons.settings_outlined, size: 18,),
                                    ),
                                    radius: 8,
                                    color: buttonBackgroundColor,
                                    sbWidth: 35,
                                    sbHeight: 35
                                ),
                                /// User Logo
                                Stack(
                                  children: [
                                    Container(
                                      height: 60,
                                      width: 60,
                                      decoration: BoxDecoration(
                                          color: buttonBackgroundColor,
                                          borderRadius: BorderRadius.all(Radius.circular(50))
                                      ),
                                      child: Icon(Icons.person, color: Colors.grey.shade400, size: 25,),
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      right: 2,
                                      child: Container(
                                        height: 8,
                                        width: 8,
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.all(Radius.circular(30))
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                /// Favourite
                                buildContainer(
                                    iconButton: IconButton(
                                      padding: EdgeInsets.zero,
                                      onPressed: (() {}),
                                      icon: Icon(Icons.favorite_outline, size: 18, color: textColorLight,),
                                    ),
                                    radius: 8,
                                    color: buttonBackgroundColor,
                                    sbHeight: 35,
                                    sbWidth: 35
                                ),
                              ],
                            ),
                            SizedBox(height: 10,),
                            Text("User ID", style: myStyleBody(),),
                            SizedBox(height: 5,),
                            Text("MUHAMMAD BIN RASHID, 24", style: myStyleHeader(),),
                            SizedBox(height: 5,),
                            Text("University of Abu Dhabi", style: myStyleBody(),),
                            SizedBox(height: 10,),
                            /// edit profile button
                            InkWell(
                              onTap: (() {

                              }),
                              child: Container(
                                height: 40,
                                width: 120,
                                decoration: BoxDecoration(
                                    color: buttonBackgroundColor,
                                    borderRadius: BorderRadius.all(Radius.circular(25))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.all(Radius.circular(25))
                                      ),
                                      child: Icon(Icons.edit, color: Colors.white, size: 12,),
                                    ),
                                    SizedBox(width: 5,),
                                    Text("Edit Profile", style: TextStyle(color: primaryColor,),)
                                  ],
                                ),
                              ),
                            ),
                            /// Tab Bar
                            SizedBox(height: 10,),
                            DefaultTabController(
                              length: 4,
                              initialIndex: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    height: 42,
                                    width: MediaQuery.of(context).size.width - 5,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: primaryColor),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: TabBar(
                                      controller: this._tabController,
                                      labelColor: Colors.black,
                                      unselectedLabelColor: Colors.grey,
                                      indicatorColor: Colors.transparent,
                                      padding: EdgeInsets.zero,
                                      indicatorPadding: EdgeInsets.zero,
                                      labelPadding: EdgeInsets.only(left: 20),
                                      isScrollable: true,
                                      onTap: ((index){
                                        setState(() {
                                          selectedTabIndex = index;
                                        });
                                        print("selectedTabIndex $selectedTabIndex");
                                      }),
                                      // DefaultTabController.of(context).index
                                      tabs: [
                                        Tab(
                                          child: selectedTabIndex == 0
                                              ? InstagramMention(text: 'Skills', textStyle: myStyle(16, Colors.white,), color: primaryColor,)
                                              : Text("Skills", style: myStyle(16, textColorLight,),),
                                        ),
                                        Tab(
                                          child:  selectedTabIndex == 1
                                              ? InstagramMention(text: 'Progress', textStyle: myStyle(16, Colors.white,), color: primaryColor,)
                                              : Text("Progress", overflow: TextOverflow.fade, style: myStyle(16, textColorLight,),),
                                        ),
                                        Tab(
                                          child:  selectedTabIndex == 2
                                              ? InstagramMention(text: 'Order', textStyle: myStyle(16, Colors.white,), color: primaryColor,)
                                              : Text("Order", style: myStyle(16, textColorLight,),),
                                        ),
                                        Tab(
                                          child:  selectedTabIndex == 3
                                              ? InstagramMention(text: 'Wallet', textStyle: myStyle(16, Colors.white,), color: primaryColor,)
                                              : Text("Wallet", style: myStyle(16, textColorLight,),),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Container(
                                    width: double.maxFinite,
                                    height: 400,
                                    child: TabBarView(
                                      physics: NeverScrollableScrollPhysics(),
                                      controller: this._tabController,
                                      children: [
                                        SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 185,
                                                width: MediaQuery.of(context).size.width - 5,
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: primaryColor),
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    /// Performance
                                                    Text("PERFORMANCE", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                                                    SizedBox(height: 10,),
                                                    Expanded(
                                                      child: ListView.separated(
                                                        physics: NeverScrollableScrollPhysics(),
                                                        shrinkWrap: true,
                                                        itemBuilder: (context, index){
                                                          return Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  LinearPercentIndicator(
                                                                    width: 240,
                                                                    lineHeight: 8.0,
                                                                    percent: 0.9,
                                                                    center: Text(""),
                                                                    progressColor: primaryColor,
                                                                    padding: EdgeInsets.zero,
                                                                  ),
                                                                  Text("90%", style: myStyleBody(),),
                                                                ],
                                                              ),
                                                              SizedBox(height: 5,),
                                                              Text("Communication & Attitude", style: myStyleBody(),),
                                                            ],
                                                          );
                                                        },
                                                        separatorBuilder: (context, index) {
                                                          return SizedBox(height: 15,);
                                                        },
                                                        itemCount: 3,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              /// Growth Journey
                                              Container(
                                                height: 80,
                                                width: MediaQuery.of(context).size.width - 5,
                                                // padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: primaryColor),
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(left: 10, top: 10,),
                                                      child: Text("GROWTH JOURNEY", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(left: 10, right: 10,),
                                                      child: Divider(),
                                                    ),
                                                    Expanded(
                                                      child: SliderTheme(
                                                        data: SliderThemeData(
                                                          overlayShape: SliderComponentShape.noThumb,
                                                        ),
                                                        child: Slider(
                                                          value: _currentSliderValue,
                                                          max: 100,
                                                          divisions: 3,
                                                          activeColor: primaryColor,
                                                          inactiveColor: secondaryColor,
                                                          label: _currentSliderValue.round().toString(),
                                                          onChanged: (double value) {
                                                            setState(() {
                                                              _currentSliderValue = value;
                                                            });
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(left:10, right: 10, top: 5, bottom: 5,),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Text("Excited", style: myStyle(16, primaryColor,),),
                                                          Text("Eager", style: myStyle(16, secondaryColor,),),
                                                          Text("Experienced", style: myStyle(16, secondaryColor,),),
                                                          Text("Expert", style: myStyle(16, secondaryColor,),),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              /// Skills
                                              Container(
                                                height: 150,
                                                width: MediaQuery.of(context).size.width - 5,
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: primaryColor),
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                                ),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    /// skills
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Text("Skills", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                                                        InkWell(
                                                          onTap: (() {

                                                          }),
                                                          child: Container(
                                                            height: 40,
                                                            width: 120,
                                                            decoration: BoxDecoration(
                                                                color: buttonBackgroundColor,
                                                                borderRadius: BorderRadius.all(Radius.circular(25))
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Text("Add More", style: TextStyle(color: textColorLight,),),
                                                                SizedBox(width: 5,),
                                                                Icon(Icons.add, color: primaryColor, size: 15,),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(),
                                                    Row(
                                                      children: [
                                                        Flexible(
                                                          child: Wrap(
                                                            runSpacing: 5.0,
                                                            spacing: 2,
                                                            children: [
                                                              RoundedContainerWithText(
                                                                height: 30,
                                                                radius: 25,
                                                                widget: Center(child: Text("Graphics Design", style: myStyle(16, secondaryColorDark, FontWeight.normal,),)),
                                                              ),
                                                              RoundedContainerWithText(
                                                                height: 30,
                                                                radius: 25,
                                                                widget: Center(child: Text("UI/UX Design", style: myStyle(16, secondaryColorDark, FontWeight.normal,),)),
                                                              ),
                                                              RoundedContainerWithText(
                                                                height: 30,
                                                                radius: 25,
                                                                widget: Center(child: Text("Photography", style: myStyle(16, secondaryColorDark, FontWeight.normal,),)),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                        // RoundedContainerWithText(height: 30, radius: 25, txt: "Brand Identity"),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              CommonContainer(
                                                context: context,
                                                height: 95,
                                                radius: 5,
                                                widget: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(left: 5.0, top: 5,),
                                                      child: Text("WORKED WITH", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                                                    ),
                                                    Expanded(
                                                      child: SingleChildScrollView(
                                                        scrollDirection: Axis.horizontal,
                                                        child: ListView.builder(
                                                          physics: NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          scrollDirection: Axis.horizontal,
                                                          itemBuilder: (context, index) {
                                                            return CircleContainer(
                                                              height: 25,
                                                              width: 57,
                                                              widget: Center(
                                                                child: Text("R"),
                                                              ),
                                                            );
                                                          },
                                                          itemCount: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              CommonContainer(
                                                context: context,
                                                height: 110,
                                                radius: 5,
                                                widget: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(left: 5.0, top: 5,),
                                                      child: Text("COMPLETED COURSE", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                                                    ),
                                                    Expanded(
                                                      child: SingleChildScrollView(
                                                        scrollDirection: Axis.horizontal,
                                                        child: ListView.builder(
                                                          physics: NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          scrollDirection: Axis.horizontal,
                                                          itemBuilder: (context, index) {
                                                            return CircleContainerBadge(
                                                              height: 70,
                                                              width: 60,
                                                              widget: Center(
                                                                child: Text("R"),
                                                              ),
                                                            );
                                                          },
                                                          itemCount: 10,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              CommonContainer(
                                                context: context,
                                                height: 200,
                                                radius: 5,
                                                widget: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(left: 5.0, top: 5,),
                                                      child: Text("REVIEWS FROM BUSINESS", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                                                    ),
                                                    Expanded(
                                                      child: SingleChildScrollView(
                                                        scrollDirection: Axis.vertical,
                                                        child: ListView.builder(
                                                          physics: NeverScrollableScrollPhysics(),
                                                          shrinkWrap: true,
                                                          scrollDirection: Axis.vertical,
                                                          itemBuilder: (context, index) {
                                                            return Padding(
                                                              padding: const EdgeInsets.all(5.0),
                                                              child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                children: [
                                                                  Expanded(
                                                                    flex: 1,
                                                                    child: Container(
                                                                      height: 60,
                                                                      width: 60,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.white,
                                                                        border: Border.all(color: secondaryColor),
                                                                        shape: BoxShape.circle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(width: 15,),
                                                                  Expanded(
                                                                    flex: 5,
                                                                    child: Column(
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "StarBucks",
                                                                              style: myStyle(20, textColorLight, FontWeight.normal),
                                                                            ),
                                                                            SizedBox(width: 10,),
                                                                            /// Ratings
                                                                            RatingBar.builder(
                                                                              itemSize: 15,
                                                                              initialRating: 3,
                                                                              minRating: 1,
                                                                              direction: Axis.horizontal,
                                                                              allowHalfRating: true,
                                                                              itemCount: 5,
                                                                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                                                              itemBuilder: (context, _) => Icon(
                                                                                Icons.star,
                                                                                color: primaryColor,
                                                                              ),
                                                                              onRatingUpdate: (rating) {
                                                                                print(rating);
                                                                              },
                                                                            )
                                                                          ],
                                                                        ),
                                                                        SizedBox(height: 8,),
                                                                        Text(
                                                                          "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
                                                                          style: myStyle(14, secondaryColor),
                                                                        ),
                                                                        SizedBox(height: 5,),
                                                                        Row(
                                                                          children: [
                                                                            TextButton(     // <-- TextButton
                                                                              onPressed: () {},
                                                                              style: TextButton.styleFrom(
                                                                                  padding: EdgeInsets.zero,
                                                                                  // minimumSize: Size(50, 30),
                                                                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                  alignment: Alignment.centerLeft),
                                                                              child: Row(
                                                                                children: [
                                                                                  Text("Reply", style: myStyle(15, textColorLight),),
                                                                                  SizedBox(width: 5,),
                                                                                  Icon(
                                                                                    Icons.reply,
                                                                                    size: 15,
                                                                                    color: primaryColor,
                                                                                  )
                                                                                ],
                                                                              ),

                                                                            ),
                                                                            SizedBox(width: 10,),
                                                                            Text("1 reply", style: myStyle(15, textColorLight),),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                          itemCount: 3,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        CommonContainer(
                                          context: context,
                                          height: 200,
                                          radius: 5,
                                          widget: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 5.0, top: 5,),
                                                child: Row(
                                                  children: [
                                                    Text("ACTIVE ORDER - 3", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                                                    Text(" (\$45)", style: myStyle(12, secondaryColorDark, FontWeight.normal),),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Business Name", style: myStyle(12, textColorLight, FontWeight.normal),),
                                                    Text("Time Remaining", style: myStyle(12, textColorLight, FontWeight.normal),),
                                                    Text("Amount", style: myStyle(12, textColorLight, FontWeight.normal),),
                                                  ],
                                                ),
                                              ),
                                              /// Listview
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  scrollDirection: Axis.vertical,
                                                  child: ListView.builder(
                                                    physics: NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    scrollDirection: Axis.vertical,
                                                    itemBuilder: (context, index) {
                                                      return Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: CommonContainer(
                                                              context: context,
                                                              height: 50,
                                                              radius: 5,
                                                              widget: Padding(
                                                                padding: const EdgeInsets.all(5.0),
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
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
                                                                        SizedBox(width: 3,),
                                                                        Text("StarBucks", style: myStyle(12, textColorLight, FontWeight.normal),),
                                                                      ],
                                                                    ),
                                                                    Text("02h 25m 30s", style: myStyle(12, textColorLight, FontWeight.normal),),
                                                                    Text("\$56", style: myStyle(12, textColorLight, FontWeight.normal),),
                                                                  ],
                                                                ),
                                                              )
                                                          )
                                                      );
                                                    },
                                                    itemCount: 3,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 10,),
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(5.0),
                                                    child: Container(
                                                      padding: EdgeInsets.all(5.0),
                                                      // height: 100,
                                                      width: MediaQuery.of(context).size.width - 5,
                                                      constraints: BoxConstraints(
                                                        maxHeight: double.infinity,
                                                      ),
                                                      decoration: BoxDecoration(
                                                          border: Border.all(color: primaryColor),
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.all(Radius.circular(5))
                                                      ),
                                                      child: Column(
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
                                                                widget: Text("\$50", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(height: 10.0,),
                                                          ///TIME
                                                          ContainerWithContraints(
                                                            opacity: 0.5,
                                                            width: MediaQuery.of(context).size.width - 5,
                                                            color: primaryColor.withOpacity(0.3),
                                                            widget: Column(
                                                              children: [
                                                                Text("Time Remaining", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                                                Padding(
                                                                  padding: const EdgeInsets.only(left: 25, right: 25, top: 10,),
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Column(
                                                                        children: [
                                                                          ContainerWithContraints(
                                                                            opacity: 0.3,
                                                                            widget: Text("02", style: myStyle(15, primaryColor, FontWeight.bold),),
                                                                          ),
                                                                          SizedBox(height: 8,),
                                                                          Text("Day", style: myStyle(15, secondaryColorDark, FontWeight.normal),),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(top: 6.0),
                                                                        child: Text(":", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          ContainerWithContraints(
                                                                            opacity: 0.3,
                                                                            widget: Text("02", style: myStyle(15, primaryColor, FontWeight.bold),),
                                                                          ),
                                                                          SizedBox(height: 8,),
                                                                          Text("Hour", style: myStyle(15, secondaryColorDark, FontWeight.normal),),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(top: 6.0),
                                                                        child: Text(":", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          ContainerWithContraints(
                                                                            opacity: 0.3,
                                                                            widget: Text("02", style: myStyle(15, primaryColor, FontWeight.bold),),
                                                                          ),
                                                                          SizedBox(height: 8,),
                                                                          Text("Min", style: myStyle(15, secondaryColorDark, FontWeight.normal),),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsets.only(top: 6.0),
                                                                        child: Text(":", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                                                      ),
                                                                      Column(
                                                                        children: [
                                                                          ContainerWithContraints(
                                                                            opacity: 0.3,
                                                                            widget: Text("02", style: myStyle(15, primaryColor, FontWeight.bold),),
                                                                          ),
                                                                          SizedBox(height: 8,),
                                                                          Text("Sec", style: myStyle(15, secondaryColorDark, FontWeight.normal),),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(height: 5.0,),
                                                          /// PRoject Brief/Document
                                                          // Row(
                                                          //   children: [
                                                          //     TextButton(
                                                          //       style: TextButton.styleFrom(
                                                          //           padding: EdgeInsets.zero,
                                                          //           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          //           alignment: Alignment.centerLeft),
                                                          //       onPressed: (() {
                                                          //
                                                          //       }),
                                                          //       child: Text("Project Brief", style: myStyle(15, textColorLight, FontWeight.normal),),
                                                          //     ),
                                                          //     SizedBox(width: 15.0,),
                                                          //     TextButton(
                                                          //       style: TextButton.styleFrom(
                                                          //           padding: EdgeInsets.zero,
                                                          //           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          //           alignment: Alignment.centerLeft),
                                                          //       onPressed: (() {
                                                          //
                                                          //       }),
                                                          //       child: Text("Documents", style: myStyle(15, textColorLight, FontWeight.normal),),
                                                          //     ),
                                                          //   ],
                                                          // ),
                                                          DefaultTabController(
                                                            length: 2,
                                                            initialIndex: 0,
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                                              children: [
                                                                TabBar(
                                                                  controller: this._projectDocController,
                                                                  labelColor: primaryColor,
                                                                  // indicator: BoxDecoration(color: primaryColor),
                                                                  unselectedLabelColor: Colors.grey,
                                                                  indicatorColor: Colors.transparent,
                                                                  padding: EdgeInsets.zero,
                                                                  indicatorPadding: EdgeInsets.zero,
                                                                  labelPadding: EdgeInsets.zero,
                                                                  isScrollable: true,
                                                                  onTap: ((index){
                                                                    setState(() {
                                                                      selectedProjectDocTabIndex = index;
                                                                    });
                                                                    print("selectedTabIndex $selectedProjectDocTabIndex");
                                                                  }),
                                                                  tabs: [
                                                                    Tab(
                                                                      child: Text("Project Brief", style: myStyle(15, selectedProjectDocTabIndex == 0 ? primaryColor : textColorLight, FontWeight.normal),),
                                                                    ),
                                                                    Tab(
                                                                      child:  Padding(
                                                                        padding: EdgeInsets.only(left: 15.0),
                                                                        child: Text("Documents", style: myStyle(15, selectedProjectDocTabIndex == 1 ? primaryColor : textColorLight, FontWeight.normal),),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(height: 10,),
                                                                Container(
                                                                  width: MediaQuery.of(context).size.width - 5,
                                                                  height: 200,
                                                                  child: TabBarView(
                                                                    physics: NeverScrollableScrollPhysics(),
                                                                    controller: this._projectDocController,
                                                                    children: [
                                                                      SingleChildScrollView(
                                                                        physics: NeverScrollableScrollPhysics(),
                                                                        child: Column(
                                                                          children: [
                                                                            Container(
                                                                                constraints: BoxConstraints(
                                                                                  maxWidth: double.maxFinite,
                                                                                  maxHeight: double.infinity,
                                                                                ),
                                                                                child: Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.")
                                                                            ),
                                                                            SizedBox(height: 10),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: 120,
                                                                                  child: CustomeBorderButton(
                                                                                    onTap: () async {
                                                                                    },
                                                                                    title: "Go to inbox",
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 120,
                                                                                  child: CustomeButton(
                                                                                    onTap: () async {
                                                                                    },
                                                                                    title: "Submit work",
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SingleChildScrollView(
                                                                        scrollDirection: Axis.vertical,
                                                                        child: ListView.builder(
                                                                          physics: NeverScrollableScrollPhysics(),
                                                                          shrinkWrap: true,
                                                                          scrollDirection: Axis.vertical,
                                                                          itemBuilder: (context, index) {
                                                                            return Padding(
                                                                                padding: const EdgeInsets.all(5.0),
                                                                                child: CommonContainer(
                                                                                    context: context,
                                                                                    height: 50,
                                                                                    radius: 5,
                                                                                    widget: Padding(
                                                                                      padding: const EdgeInsets.all(5.0),
                                                                                      child: Row(
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Column(
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Text("Documents.Xls", style: myStyle(12, secondaryColorDark, FontWeight.bold),),
                                                                                              SizedBox(height: 5),
                                                                                              Text("20 june, 2022", style: myStyle(12, textColorLight, FontWeight.normal),),
                                                                                            ],
                                                                                          ),
                                                                                          Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: secondaryColor,
                                                                                              border: Border.all(color: Colors.white),
                                                                                              shape: BoxShape.circle,
                                                                                            ),
                                                                                            child: IconButton(
                                                                                              icon: Icon(Icons.cloud_download_outlined, color: primaryColor,),
                                                                                              iconSize: 15,
                                                                                              onPressed: (() {}),
                                                                                            ),
                                                                                          )
                                                                                        ],
                                                                                      ),
                                                                                    )
                                                                                )
                                                                            );
                                                                          },
                                                                          itemCount: 3,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        /// Students Wallet

                                        // CommonContainer(
                                        //   context: context,
                                        //   height: 200,
                                        //   radius: 5,
                                        //   widget: Column(
                                        //     crossAxisAlignment: CrossAxisAlignment.start,
                                        //     mainAxisAlignment: MainAxisAlignment.start,
                                        //     children: [
                                        //       Padding(
                                        //         padding: const EdgeInsets.all(5.0),
                                        //         child: ContainerWithContraints(
                                        //           opacity: 0.5,
                                        //           width: MediaQuery.of(context).size.width - 5,
                                        //           color: primaryColor.withOpacity(0.3),
                                        //           widget: Column(
                                        //             children: [
                                        //               Text("Your next withdraw date is 13th August, 2022", style: myStyle(12, secondaryColorDark, FontWeight.bold),),
                                        //               Text("Last withdraw date 07, August, 2022", style: myStyle(12, textColorLight, FontWeight.normal),),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       Padding(
                                        //         padding: const EdgeInsets.all(5.0),
                                        //         child: Text("WITHDRAW WALLET", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                        //       ),
                                        //
                                        //       /// Listview
                                        //       Expanded(
                                        //         child: SingleChildScrollView(
                                        //           scrollDirection: Axis.vertical,
                                        //           child: ListView.builder(
                                        //             physics: NeverScrollableScrollPhysics(),
                                        //             shrinkWrap: true,
                                        //             scrollDirection: Axis.vertical,
                                        //             itemBuilder: (context, index) {
                                        //               return Padding(
                                        //                 padding: const EdgeInsets.all(5.0),
                                        //                 child: Container(
                                        //                   height: 60,
                                        //                   width: MediaQuery.of(context).size.width - 5,
                                        //                   padding: EdgeInsets.all(5),
                                        //                   decoration: BoxDecoration(
                                        //                       border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        //                       color: Colors.white,
                                        //                       borderRadius: BorderRadius.all(Radius.circular(5))
                                        //                   ),
                                        //                   child: Row(
                                        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //                     children: [
                                        //                       Column(
                                        //                         crossAxisAlignment: CrossAxisAlignment.start,
                                        //                         children: [
                                        //                           Text("Walve 1", style: myStyle(12, secondaryColorDark, FontWeight.normal),),
                                        //                           SizedBox(height: 3),
                                        //                           Text("Muhammad Bin Rashid", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                        //                           SizedBox(height: 3),
                                        //                           Text("0000 1112421455124455445", style: myStyle(12, textColorLight, FontWeight.normal),),
                                        //                         ],
                                        //                       ),
                                        //                       SizedBox(
                                        //                         width: 80,
                                        //                         height: 30,
                                        //                         child: InkWell(
                                        //                           onTap: ((){}),
                                        //                           child: Container(
                                        //                             alignment: Alignment.center,
                                        //                             child: Text("Withdraw",style: myStyle(12,primaryColor,FontWeight.w400),),
                                        //                             padding: EdgeInsets.symmetric(vertical: 3),
                                        //                             width: double.infinity,
                                        //                             decoration: BoxDecoration(
                                        //                                 border: Border.all(
                                        //                                     color: textColorLight.withOpacity(0.5),
                                        //                                     width:  1
                                        //                                 ),
                                        //                                 borderRadius: BorderRadius.circular(8)),
                                        //                           ),
                                        //                         ),
                                        //                       )
                                        //                     ],
                                        //                   ),
                                        //                 ),
                                        //               );
                                        //             },
                                        //             itemCount: 3,
                                        //           ),
                                        //         ),
                                        //       ),
                                        //       Padding(
                                        //         padding: const EdgeInsets.all(5.0),
                                        //         child: Container(
                                        //           height: 60,
                                        //           width: MediaQuery.of(context).size.width - 5,
                                        //           padding: EdgeInsets.all(5),
                                        //           decoration: BoxDecoration(
                                        //               border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        //               color: Colors.white,
                                        //               borderRadius: BorderRadius.all(Radius.circular(5))
                                        //           ),
                                        //           child: Column(
                                        //             crossAxisAlignment: CrossAxisAlignment.start,
                                        //             children: [
                                        //               Text("ADD NEW WALLET", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                        //               SizedBox(height: 3),
                                        //               SizedBox(
                                        //                 height: 25,
                                        //                 width: MediaQuery.of(context).size.width - 5,
                                        //                 child: InkWell(
                                        //                   onTap: ((){}),
                                        //                   child: Container(
                                        //                     alignment: Alignment.center,
                                        //                     child: Text("Add New Wallet",style: myStyle(12,Colors.white,FontWeight.w400),),
                                        //                     padding: EdgeInsets.symmetric(vertical: 3),
                                        //                     width: double.infinity,
                                        //                     decoration: BoxDecoration(
                                        //                         color: primaryColor,
                                        //                         borderRadius: BorderRadius.circular(8)),
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ],
                                        //           ),
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),

                                        /// SME Wallet
                                        // Column(
                                        //   crossAxisAlignment: CrossAxisAlignment.start,
                                        //   mainAxisAlignment: MainAxisAlignment.start,
                                        //   children: [
                                        //     Container(
                                        //       height: 100,
                                        //       width: MediaQuery.of(context).size.width - 5,
                                        //       padding: EdgeInsets.all(5),
                                        //       decoration: BoxDecoration(
                                        //           border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        //           color: Colors.white,
                                        //           borderRadius: BorderRadius.all(Radius.circular(5))
                                        //       ),
                                        //       child: Column(
                                        //         crossAxisAlignment: CrossAxisAlignment.start,
                                        //         mainAxisAlignment: MainAxisAlignment.start,
                                        //         children: [
                                        //           Padding(
                                        //             padding: const EdgeInsets.all(5.0),
                                        //             child: Text("MY WALLET", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                        //           ),
                                        //
                                        //           Padding(
                                        //             padding: const EdgeInsets.all(5.0),
                                        //             child: Row(
                                        //               children: [
                                        //                 Container(
                                        //                   height: 50,
                                        //                   width: 88,
                                        //                   padding: EdgeInsets.all(5),
                                        //                   decoration: BoxDecoration(
                                        //                       border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        //                       color: Colors.white,
                                        //                       borderRadius: BorderRadius.all(Radius.circular(5))
                                        //                   ),
                                        //                   child: Row(
                                        //                     // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        //                     children: [
                                        //                       Padding(
                                        //                         padding: EdgeInsets.zero,
                                        //                         child: Icon(Icons.currency_bitcoin, size: 15,),
                                        //                       ),
                                        //                       SizedBox(width: 3),
                                        //                       Column(
                                        //                         crossAxisAlignment: CrossAxisAlignment.start,
                                        //                         mainAxisAlignment: MainAxisAlignment.center,
                                        //                         children: [
                                        //                           Text("\$2,589", style: myStyle(12, secondaryColorDark, FontWeight.bold),),
                                        //                           SizedBox(height: 3),
                                        //                           Text("Available Balance", style: myStyle(8, secondaryColorDark, FontWeight.normal),),
                                        //                         ],
                                        //                       ),
                                        //                     ],
                                        //                   ),
                                        //                 ),
                                        //                 SizedBox(width: 8),
                                        //                 Container(
                                        //                   height: 50,
                                        //                   width: 85,
                                        //                   padding: EdgeInsets.all(5),
                                        //                   decoration: BoxDecoration(
                                        //                       border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        //                       color: Colors.white,
                                        //                       borderRadius: BorderRadius.all(Radius.circular(5))
                                        //                   ),
                                        //                   child: Row(
                                        //                     // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        //                     children: [
                                        //                       Padding(
                                        //                         padding: EdgeInsets.zero,
                                        //                         child: Icon(Icons.currency_bitcoin, size: 15,),
                                        //                       ),
                                        //                       SizedBox(width: 3),
                                        //                       Column(
                                        //                         crossAxisAlignment: CrossAxisAlignment.start,
                                        //                         mainAxisAlignment: MainAxisAlignment.center,
                                        //                         children: [
                                        //                           Text("10", style: myStyle(12, secondaryColorDark, FontWeight.bold),),
                                        //                           SizedBox(height: 3),
                                        //                           Text("Active Orders", style: myStyle(8, secondaryColorDark, FontWeight.normal),),
                                        //                         ],
                                        //                       ),
                                        //                     ],
                                        //                   ),
                                        //                 ),
                                        //                 SizedBox(width: 8),
                                        //                 Container(
                                        //                   height: 50,
                                        //                   width: 85,
                                        //                   padding: EdgeInsets.all(5),
                                        //                   decoration: BoxDecoration(
                                        //                       border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        //                       color: Colors.white,
                                        //                       borderRadius: BorderRadius.all(Radius.circular(5))
                                        //                   ),
                                        //                   child: Row(
                                        //                     // mainAxisAlignment: MainAxisAlignment.sp,
                                        //                     children: [
                                        //                       Padding(
                                        //                         padding: EdgeInsets.zero,
                                        //                         child: Icon(Icons.currency_bitcoin, size: 15,),
                                        //                       ),
                                        //                       SizedBox(width: 3),
                                        //                       Column(
                                        //                         crossAxisAlignment: CrossAxisAlignment.start,
                                        //                         mainAxisAlignment: MainAxisAlignment.center,
                                        //                         children: [
                                        //                           Text("\$2,589", style: myStyle(12, secondaryColorDark, FontWeight.bold),),
                                        //                           SizedBox(height: 3),
                                        //                           Text("Total Spent", style: myStyle(8, secondaryColorDark, FontWeight.normal),),
                                        //                         ],
                                        //                       ),
                                        //                     ],
                                        //                   ),
                                        //                 ),
                                        //               ],
                                        //             ),
                                        //           ),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //
                                        //     Padding(
                                        //       padding: const EdgeInsets.all(5.0),
                                        //       child: Container(
                                        //         height: 60,
                                        //         width: MediaQuery.of(context).size.width - 5,
                                        //         padding: EdgeInsets.all(5),
                                        //         decoration: BoxDecoration(
                                        //             border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        //             color: Colors.white,
                                        //             borderRadius: BorderRadius.all(Radius.circular(5))
                                        //         ),
                                        //         child: Column(
                                        //           crossAxisAlignment: CrossAxisAlignment.start,
                                        //           children: [
                                        //             Text("ADD MONEY", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                        //             SizedBox(height: 3),
                                        //             SizedBox(
                                        //               height: 25,
                                        //               width: MediaQuery.of(context).size.width - 5,
                                        //               child: InkWell(
                                        //                 onTap: ((){}),
                                        //                 child: Container(
                                        //                   alignment: Alignment.center,
                                        //                   child: Text("Add Money",style: myStyle(12,Colors.white,FontWeight.w400),),
                                        //                   padding: EdgeInsets.symmetric(vertical: 3),
                                        //                   width: double.infinity,
                                        //                   decoration: BoxDecoration(
                                        //                       color: primaryColor,
                                        //                       borderRadius: BorderRadius.circular(8)),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),

                                        /// SME post a gig
                                        // Column(
                                        //   children: [
                                        //     Container(
                                        //       height: 120,
                                        //       width: MediaQuery.of(context).size.width - 5,
                                        //       padding: EdgeInsets.all(5),
                                        //       decoration: BoxDecoration(
                                        //           border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        //           color: Colors.white,
                                        //           borderRadius: BorderRadius.all(Radius.circular(5))
                                        //       ),
                                        //       child: Padding(
                                        //         padding: const EdgeInsets.all(5.0),
                                        //         child: Column(
                                        //           crossAxisAlignment: CrossAxisAlignment.start,
                                        //           children: [
                                        //             Text("Select what you want to do", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                        //             SizedBox(height: 5),
                                        //             SizedBox(
                                        //               height: 35,
                                        //               width: MediaQuery.of(context).size.width - 5,
                                        //                 child: InkWell(
                                        //                   onTap: (){},
                                        //                   child: Container(
                                        //                     alignment: Alignment.center,
                                        //                     child: Text("Post a Gig (single task for 1 person)",style: myStyle(12,Colors.white,FontWeight.w400),),
                                        //                     padding: EdgeInsets.symmetric(vertical: 8),
                                        //                     width: double.infinity,
                                        //                     decoration: BoxDecoration(
                                        //                         color: primaryColor,
                                        //                         borderRadius: BorderRadius.circular(8)),
                                        //                   ),
                                        //                 )
                                        //             ),
                                        //             SizedBox(height: 5),
                                        //             SizedBox(
                                        //                 height: 35,
                                        //                 width: MediaQuery.of(context).size.width - 5,
                                        //                 child: InkWell(
                                        //                   onTap: (){},
                                        //                   child: Container(
                                        //                     alignment: Alignment.center,
                                        //                     child: Text("Post a project (Multiple gigs w' for multiple people)",style: myStyle(12,primaryColor,FontWeight.w400),),
                                        //                     padding: EdgeInsets.symmetric(vertical: 12),
                                        //                     width: double.infinity,
                                        //                     decoration: BoxDecoration(
                                        //                         border: Border.all(
                                        //                             color: primaryColor,
                                        //                             width:  1
                                        //                         ),
                                        //                         borderRadius: BorderRadius.circular(8)),
                                        //                   ),
                                        //                 )
                                        //             ),
                                        //           ]
                                        //         ),
                                        //       )
                                        //     ),
                                        //     SizedBox(height: 5),
                                        //     Container(
                                        //       height: 160,
                                        //       width: MediaQuery.of(context).size.width - 5,
                                        //       padding: EdgeInsets.all(5),
                                        //       decoration: BoxDecoration(
                                        //           border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        //           color: Colors.white,
                                        //           borderRadius: BorderRadius.all(Radius.circular(5))
                                        //       ),
                                        //       child: Padding(
                                        //         padding: const EdgeInsets.all(5.0),
                                        //         child: Column(
                                        //           crossAxisAlignment: CrossAxisAlignment.start,
                                        //           // mainAxisAlignment: MainAxisAlignment.center,
                                        //           children: [
                                        //             Text("Favourite student's profile", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                        //             SizedBox(height: 5),
                                        //             Expanded(
                                        //               child: SingleChildScrollView(
                                        //                 scrollDirection: Axis.vertical,
                                        //                 child: ListView.builder(
                                        //                   physics: NeverScrollableScrollPhysics(),
                                        //                   shrinkWrap: true,
                                        //                   scrollDirection: Axis.vertical,
                                        //                   itemBuilder: (context, index) {
                                        //                     return Padding(
                                        //                       padding: const EdgeInsets.only(bottom: 5.0),
                                        //                       child: Container(
                                        //                         height: 50,
                                        //                         width: MediaQuery.of(context).size.width - 5,
                                        //                         padding: EdgeInsets.all(5),
                                        //                         decoration: BoxDecoration(
                                        //                             border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        //                             color: Colors.white,
                                        //                             borderRadius: BorderRadius.all(Radius.circular(5))
                                        //                         ),
                                        //                         child: Row(
                                        //                           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //                           children: [
                                        //                             CircleContainer(
                                        //                               height: 50,
                                        //                               width: 30,
                                        //                               widget: Center(
                                        //                                 child: Text("R"),
                                        //                               ),
                                        //                             ),
                                        //                             SizedBox(width: 10),
                                        //                             Column(
                                        //                               crossAxisAlignment: CrossAxisAlignment.start,
                                        //                               mainAxisAlignment: MainAxisAlignment.center,
                                        //                               children: [
                                        //                                 Text("Khalid Bin Walid", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                        //                                 SizedBox(height: 3),
                                        //                                 Text("Graphics Designer", style: myStyle(12, textColorLight, FontWeight.normal),),
                                        //                               ],
                                        //                             ),
                                        //                             SizedBox(width: 80),
                                        //                             Text("1", style: myStyle(12, textColorLight, FontWeight.normal),),
                                        //                           ],
                                        //                         ),
                                        //                       ),
                                        //                     );
                                        //                   },
                                        //                   itemCount: 3,
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ]
                                        //         ),
                                        //       )
                                        //     ),
                                        //   ],
                                        // ),

                                        /// SME Ratings
                                        // SingleChildScrollView(
                                        //   child: Column(
                                        //     children: [
                                        //       Container(
                                        //         height: 150,
                                        //         width: MediaQuery.of(context).size.width - 5,
                                        //         padding: EdgeInsets.all(10),
                                        //         decoration: BoxDecoration(
                                        //             border: Border.all(color: primaryColor),
                                        //             color: Colors.white,
                                        //             borderRadius: BorderRadius.all(Radius.circular(5))
                                        //         ),
                                        //         child: Column(
                                        //           crossAxisAlignment: CrossAxisAlignment.start,
                                        //           children: [
                                        //             /// Youth Reviews
                                        //             Text("YOUTH REVIEWS", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                                        //             SizedBox(height: 10,),
                                        //             Expanded(
                                        //               child: ListView.separated(
                                        //                 physics: NeverScrollableScrollPhysics(),
                                        //                 shrinkWrap: true,
                                        //                 itemBuilder: (context, index){
                                        //                   return Column(
                                        //                     crossAxisAlignment: CrossAxisAlignment.start,
                                        //                     children: [
                                        //                       Row(
                                        //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //                         children: [
                                        //                           LinearPercentIndicator(
                                        //                             width: 240,
                                        //                             lineHeight: 8.0,
                                        //                             percent: 0.9,
                                        //                             center: Text(""),
                                        //                             progressColor: primaryColor,
                                        //                             padding: EdgeInsets.zero,
                                        //                           ),
                                        //                           Text("90%", style: myStyleBody(),),
                                        //                         ],
                                        //                       ),
                                        //                       SizedBox(height: 5,),
                                        //                       Text("Skills and Knowledge Gained", style: myStyleBody(),),
                                        //                     ],
                                        //                   );
                                        //                 },
                                        //                 separatorBuilder: (context, index) {
                                        //                   return SizedBox(height: 5,);
                                        //                 },
                                        //                 itemCount: 3,
                                        //               ),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //       SizedBox(height: 10,),
                                        //       /// Recent Hires
                                        //       CommonContainer(
                                        //         context: context,
                                        //         height: 95,
                                        //         radius: 5,
                                        //         widget: Column(
                                        //           crossAxisAlignment: CrossAxisAlignment.start,
                                        //           children: [
                                        //             Padding(
                                        //               padding: EdgeInsets.only(left: 5.0, top: 5,),
                                        //               child: Text("RECENT HIRE'S", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                                        //             ),
                                        //             Expanded(
                                        //               child: SingleChildScrollView(
                                        //                 scrollDirection: Axis.horizontal,
                                        //                 child: ListView.builder(
                                        //                   physics: NeverScrollableScrollPhysics(),
                                        //                   shrinkWrap: true,
                                        //                   scrollDirection: Axis.horizontal,
                                        //                   itemBuilder: (context, index) {
                                        //                     return CircleContainer(
                                        //                       height: 25,
                                        //                       width: 57,
                                        //                       widget: Center(
                                        //                         child: Text("R"),
                                        //                       ),
                                        //                     );
                                        //                   },
                                        //                   itemCount: 10,
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //       /// Reviews from students
                                        //       SizedBox(height: 10,),
                                        //       CommonContainer(
                                        //         context: context,
                                        //         height: 200,
                                        //         radius: 5,
                                        //         widget: Column(
                                        //           crossAxisAlignment: CrossAxisAlignment.start,
                                        //           mainAxisAlignment: MainAxisAlignment.start,
                                        //           children: [
                                        //             Padding(
                                        //               padding: EdgeInsets.only(left: 5.0, top: 5,),
                                        //               child: Text("REVIEWS FROM STUDENTS", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                                        //             ),
                                        //             Expanded(
                                        //               child: SingleChildScrollView(
                                        //                 scrollDirection: Axis.vertical,
                                        //                 child: ListView.builder(
                                        //                   physics: NeverScrollableScrollPhysics(),
                                        //                   shrinkWrap: true,
                                        //                   scrollDirection: Axis.vertical,
                                        //                   itemBuilder: (context, index) {
                                        //                     return Padding(
                                        //                       padding: const EdgeInsets.all(5.0),
                                        //                       child: Row(
                                        //                         crossAxisAlignment: CrossAxisAlignment.start,
                                        //                         mainAxisAlignment: MainAxisAlignment.start,
                                        //                         children: [
                                        //                           Expanded(
                                        //                             flex: 1,
                                        //                             child: Container(
                                        //                               height: 60,
                                        //                               width: 60,
                                        //                               decoration: BoxDecoration(
                                        //                                 color: Colors.white,
                                        //                                 border: Border.all(color: secondaryColor),
                                        //                                 shape: BoxShape.circle,
                                        //                               ),
                                        //                             ),
                                        //                           ),
                                        //                           SizedBox(width: 15,),
                                        //                           Expanded(
                                        //                             flex: 5,
                                        //                             child: Column(
                                        //                               children: [
                                        //                                 Row(
                                        //                                   children: [
                                        //                                     Text(
                                        //                                       "StarBucks",
                                        //                                       style: myStyle(20, textColorLight, FontWeight.normal),
                                        //                                     ),
                                        //                                     SizedBox(width: 10,),
                                        //                                     /// Ratings
                                        //                                     RatingBar.builder(
                                        //                                       itemSize: 15,
                                        //                                       initialRating: 3,
                                        //                                       minRating: 1,
                                        //                                       direction: Axis.horizontal,
                                        //                                       allowHalfRating: true,
                                        //                                       itemCount: 5,
                                        //                                       itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                        //                                       itemBuilder: (context, _) => Icon(
                                        //                                         Icons.star,
                                        //                                         color: primaryColor,
                                        //                                       ),
                                        //                                       onRatingUpdate: (rating) {
                                        //                                         print(rating);
                                        //                                       },
                                        //                                     )
                                        //                                   ],
                                        //                                 ),
                                        //                                 SizedBox(height: 8,),
                                        //                                 Text(
                                        //                                   "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
                                        //                                   style: myStyle(14, secondaryColor),
                                        //                                 ),
                                        //                                 SizedBox(height: 5,),
                                        //                                 Row(
                                        //                                   children: [
                                        //                                     TextButton(     // <-- TextButton
                                        //                                       onPressed: () {},
                                        //                                       style: TextButton.styleFrom(
                                        //                                           padding: EdgeInsets.zero,
                                        //                                           // minimumSize: Size(50, 30),
                                        //                                           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        //                                           alignment: Alignment.centerLeft),
                                        //                                       child: Row(
                                        //                                         children: [
                                        //                                           Text("Reply", style: myStyle(15, textColorLight),),
                                        //                                           SizedBox(width: 5,),
                                        //                                           Icon(
                                        //                                             Icons.reply,
                                        //                                             size: 15,
                                        //                                             color: primaryColor,
                                        //                                           )
                                        //                                         ],
                                        //                                       ),
                                        //
                                        //                                     ),
                                        //                                     SizedBox(width: 10,),
                                        //                                     Text("1 reply", style: myStyle(15, textColorLight),),
                                        //                                   ],
                                        //                                 ),
                                        //                               ],
                                        //                             ),
                                        //                           ),
                                        //                         ],
                                        //                       ),
                                        //                     );
                                        //                   },
                                        //                   itemCount: 3,
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       ),
                                        //     ],
                                        //   ),
                                        // ),

                                        /// SME Progress
                                        SingleChildScrollView(
                                          child: Container(
                                            height: 350,
                                            width: MediaQuery.of(context).size.width - 5,
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                                border: Border.all(color: primaryColor),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(5))
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("ACTIVE GIGS ORDER", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                                                SizedBox(height: 10,),
                                                Expanded(
                                                  child: SingleChildScrollView(
                                                    child: ListView.separated(
                                                      physics: NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemBuilder: (context, index){
                                                        return Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            CommonContainer(
                                                              context: context,
                                                              height: 130,
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
                                                                          widget: Text("\$50", style: myStyle(10, secondaryColorDark, FontWeight.bold),),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(height: 5,),
                                                                    Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                                                                      style: myStyle(10, textColorLight, FontWeight.normal),),
                                                                    SizedBox(height: 5,),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        BorderButton(
                                                                          onTap: ((){}),
                                                                          title: Text("Graphic Design",style: myStyle(8,textColorLight,FontWeight.w400),),
                                                                          height: 30,
                                                                          width: 70,
                                                                        ),
                                                                        BorderButton(
                                                                          onTap: ((){}),
                                                                          title: Text("8 Days",style: myStyle(8,textColorLight,FontWeight.w400),),
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
                                                                              Text("Abu Dhabi",style: myStyle(8,textColorLight,FontWeight.w400),),
                                                                            ],
                                                                          ),
                                                                          height: 30,
                                                                          width: 60,
                                                                        ),
                                                                        BorderButton(
                                                                          onTap: ((){}),
                                                                          title: Text("Single Gig",style: myStyle(8,textColorLight,FontWeight.w400),),
                                                                          height: 30,
                                                                          width: 60,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                      separatorBuilder: (context, index) {
                                                        return SizedBox(height: 5,);
                                                      },
                                                      itemCount: 3,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 5,),
                                                Text("GIGS HISTORY", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                                                SizedBox(height: 10,),
                                                Expanded(
                                                  child: SingleChildScrollView(
                                                    child: ListView.separated(
                                                      physics: NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      itemBuilder: (context, index){
                                                        return Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            CommonContainer(
                                                              context: context,
                                                              height: 130,
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
                                                                          widget: Text("\$50", style: myStyle(10, secondaryColorDark, FontWeight.bold),),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(height: 5,),
                                                                    Text("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                                                                      style: myStyle(10, textColorLight, FontWeight.normal),),
                                                                    SizedBox(height: 5,),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        BorderButton(
                                                                          onTap: ((){}),
                                                                          title: Text("Graphic Design",style: myStyle(8,textColorLight,FontWeight.w400),),
                                                                          height: 30,
                                                                          width: 70,
                                                                        ),
                                                                        BorderButton(
                                                                          onTap: ((){}),
                                                                          title: Text("8 Days",style: myStyle(8,textColorLight,FontWeight.w400),),
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
                                                                              Text("Abu Dhabi",style: myStyle(8,textColorLight,FontWeight.w400),),
                                                                            ],
                                                                          ),
                                                                          height: 30,
                                                                          width: 60,
                                                                        ),
                                                                        BorderButton(
                                                                          onTap: ((){}),
                                                                          title: Text("Single Gig",style: myStyle(8,textColorLight,FontWeight.w400),),
                                                                          height: 30,
                                                                          width: 60,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      },
                                                      separatorBuilder: (context, index) {
                                                        return SizedBox(height: 5,);
                                                      },
                                                      itemCount: 3,
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
                                ],
                              ),
                            ),
                          ],
                        )
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  Container ContainerWithContraints({Widget? widget, double? width, double? opacity = 1, Color? color = Colors.white}) {
    return Container(
      padding: EdgeInsets.all(5),
      width: width,
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: primaryColor.withOpacity(opacity!)),
          borderRadius: BorderRadius.all(Radius.circular(5))
      ),
      child: widget,
    );
  }

  Widget BorderButton({VoidCallback? onTap,Widget? title, double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          child: title,
          padding: EdgeInsets.symmetric(vertical: 0),
          width: double.infinity,
          decoration: BoxDecoration(

              border: Border.all(
                  color: primaryColor,
                  width:  1
              ),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  Container CommonContainer({BuildContext? context, Widget? widget, double? height, double? radius,}) {
    return Container(
      height: height,
      width: MediaQuery.of(context!).size.width - 5,
      // padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: primaryColor),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(radius!))
      ),
      child: widget,
    );
  }

  // 30, 50, 25
  Container RoundedContainerWithText({double? height, double? radius, Widget? widget}) {
    return Container(
      height: height,
      // width: width,
      padding: EdgeInsets.all(5),
      constraints: BoxConstraints(
        maxWidth: 130,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: primaryColor),
          borderRadius: BorderRadius.all(Radius.circular(radius!))
      ),
      child: widget,
    );
  }

  Padding CircleContainer({double? height, double? width, Widget? widget}) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: secondaryColor),
          shape: BoxShape.circle,
        ),
        child: widget,
      ),
    );
  }

  Padding CircleContainerBadge({double? height, double? width, Widget? widget}) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: secondaryColor),
              shape: BoxShape.circle,
            ),
            child: widget,
          ),
          Positioned(
            // top: 0,
            right: 0,
            // left: 35,
            // bottom: 40,
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: primaryColor,
                border: Border.all(color: primaryColor),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text("4.5", style: myStyle(15, Colors.white),),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
