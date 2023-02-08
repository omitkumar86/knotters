import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knotters/provider/auth_provider.dart';
import 'package:knotters/screen/auth/sign_in/sign_in.dart';
import 'package:knotters/screen/nav_bar/community.dart';
import 'package:knotters/screen/nav_bar/sme_gigs.dart';
import 'package:knotters/screen/nav_bar/growth.dart';
import 'package:knotters/screen/nav_bar/home_page.dart';
import 'package:knotters/screen/nav_bar/student_gigs.dart';
import 'package:knotters/screen/profile/business_profile_page.dart';
import 'package:knotters/screen/profile/students_profile.dart';
import 'package:knotters/screen/profile/students_profile_page.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';
import 'package:provider/provider.dart';

class BottomNavBarPage extends StatefulWidget {
  static const String id = 'BottomNavBarPage';

  @override
  _BottomNavBarPageState createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  AuthProvider authProvider = AuthProvider();
  bool? acType;
  int selectedItem = 0;

  void getAccountType() async {
    authProvider.setAccountType =
        await authProvider.appAccountType.getAccountType();
    acType = authProvider.getAccountType;
    print(
        "reeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee${authProvider.getAccountType}");
  }

  @override
  void initState() {
    getAccountType();
    pageController = PageController(initialPage: selectedItem);

    super.initState();
  }

  PageController? pageController;

  /* List<Widget> pages = [
    CommunityPage(),
    SmeGigsPage(),
    HomePageDemo(),
    GrowthPage(),
    StudentsProfile()
  ];
*/
  void onPageChange(int index) {
    setState(() {
      selectedItem = index;
    });
  }

  MaterialButton app_bar_button({dynamic icon, required VoidCallback? onTap}) {
    return MaterialButton(
      minWidth: 0,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white70,
      onPressed: onTap,
      padding: EdgeInsets.all(6),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final accountType =
        Provider.of<AuthProvider>(context, listen: false).getAccountType;
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        /* floatingActionButton: FloatingActionButton(
          isExtended: true,
          backgroundColor: Colors.white,
          child:  SvgPicture.asset(
            "assets/menu_icon.svg",color: primaryColor,
          ),
          onPressed: () {
            pageController!.jumpToPage(2);
          },
        ),*/
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppbarButton(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              alignment: Alignment.topCenter,
                              content: Container(
                                width: double.maxFinite,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "About our platform",
                                          style: myStylePoppins(14,
                                              primaryColor, FontWeight.w500),
                                        ),
                                      ),
                                      Divider(),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            //color: primaryColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Privacy Policy",
                                                style: myStylePoppins(
                                                    14, secondaryColorDark),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 10,
                                                color: primaryColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            //color: primaryColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Cookies Policy",
                                                style: myStylePoppins(
                                                    14, secondaryColorDark),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 10,
                                                color: primaryColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            //color: primaryColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Terms of service",
                                                style: myStylePoppins(
                                                    14, secondaryColorDark),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 10,
                                                color: primaryColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            //color: primaryColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Trust & Safety",
                                                style: myStylePoppins(
                                                    14, secondaryColorDark),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 10,
                                                color: primaryColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),InkWell(
                                        onTap: () {},
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            //color: primaryColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "News & Events",
                                                style: myStylePoppins(
                                                    14, secondaryColorDark),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 10,
                                                color: primaryColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                         // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>SignInPage()));
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10),
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: primaryColor,
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "Log Out",
                                                style: myStylePoppins(
                                                    14, primaryWhite),
                                              ),
                                              Icon(
                                                Icons.arrow_forward_ios,
                                                size: 10,
                                                color: primaryWhite,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ]),
                              ),
                            );
                          });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  selectedItem == 0
                      ? SvgPicture.asset(
                          "assets/menu_icon.svg",
                          color: Colors.black,
                          height: 22,
                          width: 25,
                        )
                      : selectedItem == 1
                          ? Text(
                              "GIGS",
                              style: myStyle(24, Colors.black, FontWeight.w900),
                            )
                          : selectedItem == 3
                              ? Text(
                                  "GROWTH",
                                  style: myStyle(
                                      24, Colors.black, FontWeight.w900),
                                )
                              : selectedItem == 4
                                  ? Text(
                                      "Profile",
                                      style: myStyle(
                                          24, Colors.black, FontWeight.w900),
                                    )
                                  : Text("sldkj"),
                  Spacer(),
                  app_bar_button(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 40),
                              child: StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      alignment: Alignment.topCenter,
                                      content: Container(
                                        height: 400.0,
                                        // Change as per your requirement
                                        width: 300.0,
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Start searching here",
                                                style: myStyle(16, Colors.black,
                                                    FontWeight.w900),
                                              ),
                                              Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 8),
                                                  height: 40,
                                                  width: double.infinity,
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: TextField(
                                                            decoration:
                                                                InputDecoration(
                                                          border:
                                                              InputBorder.none,
                                                          focusedErrorBorder:
                                                              InputBorder.none,
                                                          errorBorder:
                                                              InputBorder.none,
                                                          disabledBorder:
                                                              InputBorder.none,

                                                          hintText:
                                                              "Search Keyword",
                                                          //suffixIcon: suffixIcon,
                                                          hintStyle: myStyle(14,
                                                              textColorLight),
                                                          contentPadding:
                                                              EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          0,
                                                                      horizontal:
                                                                          20),

                                                          filled: true,
                                                          focusedBorder:
                                                              OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color:
                                                                    primaryColor,
                                                                width: 1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                          fillColor:
                                                              Colors.white,
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            borderSide:
                                                                BorderSide(
                                                              color:
                                                                  primaryColor,
                                                              width: 1,
                                                            ),
                                                          ),
                                                        )),
                                                        flex: 9,
                                                      ),
                                                      SizedBox(
                                                        width: 8,
                                                      ),
                                                      Expanded(
                                                          flex: 2,
                                                          child: Container(
                                                            height:
                                                                double.infinity,
                                                            width: 100,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                color:
                                                                    primaryColor),
                                                            child: Icon(
                                                              Icons.search,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ))
                                                    ],
                                                  )),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "Recent Searches",
                                                style: myStyle(14, Colors.black,
                                                    FontWeight.w700),
                                              ),
                                              Divider(),
                                              ListView.builder(
                                                physics:
                                                    NeverScrollableScrollPhysics(),
                                                shrinkWrap: true,
                                                itemCount: 5,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 8),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            'Gujarat, India',
                                                            style: myStyle(
                                                                14,
                                                                Colors.black54,
                                                                FontWeight
                                                                    .w600),
                                                          ),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    3),
                                                            decoration: BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .black54)),
                                                            child: Icon(
                                                              Icons.close,
                                                              size: 14,
                                                              color: Colors
                                                                  .black54,
                                                            ),
                                                          )
                                                        ],
                                                      ));
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                                },
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.black54,
                        size: 20,
                      )),
                  app_bar_button(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                width: double.maxFinite,
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[]),
                              ),
                            );
                          });
                    },
                    icon: Icon(
                      Icons.notifications_none,
                      color: Colors.black54,
                      size: 20,
                    ),
                  ),
                  app_bar_button(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    alignment: Alignment.topCenter,
                                    content: Container(
                                      height: 400.0,
                                      // Change as per your requirement
                                      width: 300.0,
                                      padding:
                                          EdgeInsets.symmetric(vertical: 8),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Recent Chats",
                                                  style:
                                                      myStyle(14, primaryColor),
                                                ),
                                                SizedBox(
                                                  width: 20,
                                                ),
                                                Text(
                                                  "Spam",
                                                  style:
                                                      myStyle(14, primaryColor),
                                                ),
                                              ],
                                            ),
                                            Divider(),
                                            ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: 5,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          bottom: 8),
                                                  child: ListTile(
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                            vertical: 6,
                                                            horizontal: 10),
                                                    tileColor: scaffoldColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8)),
                                                    leading: CircleAvatar(
                                                      backgroundImage: NetworkImage(
                                                          "https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80"),
                                                    ),
                                                    title: Text(
                                                      'Gujarat, India',
                                                      style: myStyle(
                                                          14,
                                                          Colors.black87,
                                                          FontWeight.w600),
                                                    ),
                                                    subtitle: Text(
                                                      'Hay Whenever the video will be done?',
                                                      style: myStyle(
                                                          12,
                                                          Colors.black54,
                                                          FontWeight.w600),
                                                    ),
                                                    trailing: Text(
                                                      '12.30',
                                                      style: myStyle(
                                                          12,
                                                          Colors.black54,
                                                          FontWeight.w600),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ));
                              },
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.chat_bubble_outline,
                      color: Colors.black54,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: pageController,
                children: <Widget>[
                  CommunityPage(),
                  accountType ? StudentGigsPage() : SmeGigsPage(),
                  HomePageDemo(),
                  GrowthPage(),
                  accountType? BusinessProfilePage():StudentProfilePage(),
                ],
                onPageChanged: onPageChange,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Stack(
          children: [
            Container(
              height: 60,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              padding: EdgeInsets.only(bottom: 8, top: 8),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = 0;
                        pageController!.jumpToPage(0);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.supervisor_account_sharp,
                          color:
                              selectedItem == 0 ? primaryColor : Colors.black87,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          //  "Search",
                          "COMMUNITY",
                          style: myStyle(
                              13,
                              selectedItem == 0 ? primaryColor : Colors.black87,
                              FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = 1;
                        pageController!.jumpToPage(1);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/gig_icon.svg",
                          color:
                              selectedItem == 1 ? primaryColor : Colors.black87,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "GIGS",
                          // "About",
                          style: myStyle(
                              13,
                              selectedItem == 1 ? primaryColor : Colors.black87,
                              FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = 3;
                        pageController!.jumpToPage(3);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/growth_icon.svg",
                          color:
                              selectedItem == 3 ? primaryColor : Colors.black87,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          "GROWTH",
                          //  "Gallery",
                          style: myStyle(
                              13,
                              selectedItem == 3 ? primaryColor : Colors.black87,
                              FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = 4;
                        pageController!.jumpToPage(4);
                      });
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/profile_Icon.svg",
                          color:
                              selectedItem == 4 ? primaryColor : Colors.black87,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          //"Menu",
                          "PROFILE",
                          style: myStyle(
                              13,
                              selectedItem == 4 ? primaryColor : Colors.black87,
                              FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: GestureDetector(
                // backgroundColor: Colors.white,
                child: CircleAvatar(
                  maxRadius: 27,
                  backgroundColor: primaryColor,
                  child: SvgPicture.asset(
                    "assets/menu_icon.svg",
                    color: Colors.white,
                  ),
                ),
                onTap: () {
                  // pageController!.jumpToPage(2);
                },
              ),
              bottom: 30,
              left: 0,
              right: 0,
            ),
          ],
        ),
      ),
    );
  }
}

//fxcvhbfjkch
