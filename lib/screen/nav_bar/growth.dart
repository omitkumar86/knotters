import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:instagram_mention/instagram_mention.dart';
import 'package:knotters/http/custome_http.dart';
import 'package:knotters/model/sme_gig_model.dart';
import 'package:knotters/provider/gig_provider.dart';
import 'package:knotters/screen/profile/students_profile_page.dart';
import 'package:knotters/widget/const.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:z_time_ago/z_time_ago.dart';

class GrowthPage extends StatefulWidget {
  static const String id = 'GrowthPage';

  const GrowthPage({Key? key}) : super(key: key);

  @override
  State<GrowthPage> createState() => _GrowthPageState();
}

class _GrowthPageState extends State<GrowthPage> with SingleTickerProviderStateMixin {
  List<SmeGigModel> allSmeGig = [];

  fetchAllSmeGigs() async {
    await Provider.of<GigProvider>(context, listen: false).getAllSmeGig();
    setState(() {});
    print("xxxxxxxxxxxxx${allSmeGig.length}");
  }

  int selectedItem = 0;
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
    _scrollController = ScrollController();
    _tabController = TabController(length: 4, vsync: this);
    fetchAllSmeGigs();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  late ScrollController _scrollController;
  PageController? pageController;


  @override
  Widget build(BuildContext context) {
    allSmeGig = Provider.of<GigProvider>(
      context,
    ).allSmeGigList;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 10,left: 16,right: 16),
        child: NestedScrollView(
          controller: _scrollController,
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, value) {
            return [
              SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              child: Icon(Icons.more_horiz),
                              onTap: (){
                                customLogoutFunction(context);
                              },),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// User Logo
                            Stack(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: buttonBackgroundColor,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.grey.shade400,
                                    size: 25,
                                  ),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 2,
                                  child: Container(
                                    height: 8,
                                    width: 8,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(30))),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "User ID",
                          style: myStyleBody(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "COMPANY NAME",
                          style: myStyleHeader(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Event Organizer, EST",
                          style: myStyleBody(),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: (() {}),
                          child: Container(
                            height: 35,
                            width: 120,
                            decoration: BoxDecoration(
                                color: buttonBackgroundColor,
                                borderRadius:
                                BorderRadius.all(Radius.circular(25))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 18,
                                  width: 18,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(25))),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Edit Profile",
                                  style: TextStyle(
                                    color: primaryColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 42,
                          width: MediaQuery.of(context).size.width - 5,
                          decoration: BoxDecoration(
                              border: Border.all(color: primaryColor),
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                          child: TabBar(
                            controller: this._tabController,
                            labelColor: Colors.black,
                            unselectedLabelColor: Colors.grey,
                            indicatorColor: Colors.transparent,
                            padding: EdgeInsets.zero,
                            indicatorPadding: EdgeInsets.zero,
                            labelPadding: EdgeInsets.only(left: 20),
                            isScrollable: true,
                            onTap: ((index) {
                              setState(() {
                                selectedTabIndex = index;
                              });
                              print("selectedTabIndex $selectedTabIndex");
                            }),
                            // DefaultTabController.of(context).index
                            tabs: [
                              Tab(
                                child: selectedTabIndex == 0
                                    ? InstagramMention(
                                  text: 'Ratings',
                                  textStyle: myStyle(
                                    16,
                                    Colors.white,
                                  ),
                                  color: primaryColor,
                                )
                                    : Text(
                                  "Ratings",
                                  style: myStyle(
                                    16,
                                    textColorLight,
                                  ),
                                ),
                              ),
                              Tab(
                                child: selectedTabIndex == 1
                                    ? InstagramMention(
                                  text: 'Progress',
                                  textStyle: myStyle(
                                    16,
                                    Colors.white,
                                  ),
                                  color: primaryColor,
                                )
                                    : Text(
                                  "Progress",
                                  overflow: TextOverflow.fade,
                                  style: myStyle(
                                    16,
                                    textColorLight,
                                  ),
                                ),
                              ),
                              Tab(
                                child: selectedTabIndex == 2
                                    ? InstagramMention(
                                  text: 'Post Gigs',
                                  textStyle: myStyle(
                                    16,
                                    Colors.white,
                                  ),
                                  color: primaryColor,
                                )
                                    : Text(
                                  "Post Gigs",
                                  style: myStyle(
                                    16,
                                    textColorLight,
                                  ),
                                ),
                              ),
                              Tab(
                                child: selectedTabIndex == 3
                                    ? InstagramMention(
                                  text: 'Wallet',
                                  textStyle: myStyle(
                                    16,
                                    Colors.white,
                                  ),
                                  color: primaryColor,
                                )
                                    : Text(
                                  "Wallet",
                                  style: myStyle(
                                    16,
                                    textColorLight,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),

            ];
          },
          body: Container(
            child: TabBarView(
              controller: _tabController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child:  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 185,
                          width:
                          MediaQuery.of(context).size.width - 5,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border:
                              Border.all(color: primaryColor),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10))),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              /// Youth Review
                              Text(
                                "YOUTH REVIEW",
                                style: myStyle(
                                    16,
                                    secondaryColorDark,
                                    FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Expanded(
                                child: ListView.separated(
                                  physics:
                                  NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            LinearPercentIndicator(
                                              width: 240,
                                              lineHeight: 8.0,
                                              percent: 0.8,
                                              center: Text(""),
                                              progressColor:
                                              primaryColor,
                                              padding:
                                              EdgeInsets.zero,
                                            ),
                                            Text(
                                              "80%",
                                              style:
                                              myStyleBody(),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          "Skills & Knowledge Gained",
                                          style: myStyleBody(),
                                        ),
                                      ],
                                    );
                                  },
                                  separatorBuilder:
                                      (context, index) {
                                    return SizedBox(
                                      height: 15,
                                    );
                                  },
                                  itemCount: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        /// Recent Hire's
                        CommonContainer(
                          context: context,
                          height: 95,
                          radius: 5,
                          widget: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 10.0,
                                  top: 5,
                                ),
                                child: Text(
                                  "RECENT HIRE'S",
                                  style: myStyle(
                                      16,
                                      secondaryColorDark,
                                      FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  scrollDirection:
                                  Axis.horizontal,
                                  child: ListView.builder(
                                    physics:
                                    NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection:
                                    Axis.horizontal,
                                    itemBuilder:
                                        (context, index) {
                                      return CircleContainer(
                                        height: 45,
                                        width: 45,
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
                        SizedBox(
                          height: 10,
                        ),

                        /// Reviews from Students
                        CommonContainer(
                          context: context,

                          radius: 5,
                          widget: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            mainAxisAlignment:
                            MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 10.0,
                                  top: 5,
                                ),
                                child: Text(
                                  "REVIEWS FROM STUDENTS",
                                  style: myStyle(
                                      16,
                                      secondaryColorDark,
                                      FontWeight.bold),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: ListView.builder(
                                  physics:
                                  NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection:
                                  Axis.vertical,
                                  itemBuilder:
                                      (context, index) {
                                    return Padding(
                                      padding:
                                      const EdgeInsets.all(
                                          10.0),
                                      child: Row(
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment:
                                        MainAxisAlignment
                                            .start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 60,
                                              width: 60,
                                              decoration:
                                              BoxDecoration(
                                                color: Colors
                                                    .white,
                                                border: Border.all(
                                                    color:
                                                    secondaryColor),
                                                shape: BoxShape
                                                    .circle,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            flex: 5,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "StarBucks",
                                                      style: myStyle(
                                                          20,
                                                          textColorLight,
                                                          FontWeight
                                                              .normal),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),

                                                    /// Ratings
                                                    RatingBar
                                                        .builder(
                                                      itemSize:
                                                      15,
                                                      initialRating:
                                                      4,
                                                      minRating:
                                                      1,
                                                      direction:
                                                      Axis.horizontal,
                                                      allowHalfRating:
                                                      true,
                                                      itemCount:
                                                      5,
                                                      itemPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal: 4.0),
                                                      itemBuilder:
                                                          (context, _) =>
                                                          Icon(
                                                            Icons
                                                                .star,
                                                            color:
                                                            primaryColor,
                                                          ),
                                                      onRatingUpdate:
                                                          (rating) {
                                                        print(
                                                            rating);
                                                      },
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 8,
                                                ),
                                                Text(
                                                  "Reference site about Lorem Ipsum, giving information on its origins, as well as a random Lipsum generator.",
                                                  style: myStyle(
                                                      14,
                                                      secondaryColor),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Row(
                                                  children: [
                                                    TextButton(
                                                      // <-- TextButton
                                                      onPressed:
                                                          () {},
                                                      style: TextButton.styleFrom(
                                                          padding: EdgeInsets.zero,
                                                          // minimumSize: Size(50, 30),
                                                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                          alignment: Alignment.centerLeft),
                                                      child:
                                                      Row(
                                                        children: [
                                                          Text(
                                                            "Reply",
                                                            style:
                                                            myStyle(15, textColorLight),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            5,
                                                          ),
                                                          Icon(
                                                            Icons.reply,
                                                            size:
                                                            15,
                                                            color:
                                                            primaryColor,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Text(
                                                      "1 reply",
                                                      style: myStyle(
                                                          15,
                                                          textColorLight),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: 4,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ),
                ///Student Progress
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child:    SingleChildScrollView(
                    child: Column(
                      children: [
                        /// Active Gig Order
                        Container(

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
                              Text("ACTIVE GIG'S ORDERS", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                              SizedBox(height: 10,),
                              allSmeGig.isEmpty
                                  ? SizedBox(
                                height: 300,
                                child: Center(
                                  child: Text(
                                    "No Gigs Found",
                                    style: myStyle(16, Colors.black54),
                                  ),
                                ),
                              ):ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index){
                                  allSmeGig.forEach((element) {
                                    int total = 1;
                                    if (element.status == 1) {
                                      total++;
                                    }
                                  });
                                  var result = ZTimeAgo().getTimeAgo(
                                    date: DateTime.parse(
                                        allSmeGig[index].createdAt.toString()),
                                    language: Language.english,
                                  );
                                  return allSmeGig[index].status == 1
                                      ?Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        child: CommonContainer(
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
                                                        // Container(
                                                        //   height: 30,
                                                        //   width: 30,
                                                        //   decoration: BoxDecoration(
                                                        //     color: Colors.white,
                                                        //     border: Border.all(color: secondaryColor),
                                                        //     shape: BoxShape.circle,
                                                        //   ),
                                                        //   child: CachedNetworkImage(
                                                        //     height: 30,
                                                        //     imageUrl: "${imageUrl}${{
                                                        //       allSmeGig[index]
                                                        //           .user!
                                                        //           .userDetails!
                                                        //           .profileImage
                                                        //     }}",
                                                        //     // placeholder: (context, url) => CircularProgressIndicator(),
                                                        //     errorWidget: (context,
                                                        //         url, error) =>
                                                        //         Image.asset(
                                                        //             "assets/choose_auth.png"),
                                                        //   ),
                                                        // ),
                                                        Container(
                                                          padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8,
                                                              vertical: 8),
                                                          decoration: BoxDecoration(
                                                              color:
                                                              primaryColorLight,
                                                              shape: BoxShape.circle),
                                                          child: CachedNetworkImage(
                                                            height: 20,
                                                            imageUrl: "${imageUrl}${{
                                                              allSmeGig[index]
                                                                  .user!
                                                                  .userDetails!
                                                                  .profileImage
                                                            }}",
                                                            // placeholder: (context, url) => CircularProgressIndicator(),
                                                            errorWidget: (context,
                                                                url, error) =>
                                                                Image.asset(
                                                                    "assets/choose_auth.png"),
                                                          ),
                                                        ),
                                                        SizedBox(width: 5,),
                                                        Text("${allSmeGig[index].projectTitle}", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                                      ],
                                                    ),
                                                    ContainerWithContraints(
                                                      widget: Text("\$${allSmeGig[index].budget}", style: myStyle(10, secondaryColorDark, FontWeight.bold),),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                                Text("${allSmeGig[index].projectDescription}",
                                                  style: myStyle(10, textColorLight, FontWeight.normal),
                                                  maxLines: 3,),
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
                                                      title: Text("$result",style: myStyle(8,textColorLight,FontWeight.w400),),
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
                                                          Text("${allSmeGig[index].jobLocationCity}",style: myStyle(8,textColorLight,FontWeight.w400),),
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
                                        onTap: (){},
                                      ),
                                    ],
                                  ): SizedBox(
                                    height: 0,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 5,);
                                },
                                itemCount: allSmeGig.length,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                        ///Gig History
                        allSmeGig.isNotEmpty
                            ? Container(
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
                              Text("GIG HISTORY", style: myStyle(16, secondaryColorDark, FontWeight.bold),),
                              SizedBox(height: 10,),
                              ListView.separated(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index){
                                  var result = ZTimeAgo().getTimeAgo(
                                    date: DateTime.parse(
                                        allSmeGig[index].createdAt.toString()),
                                    language: Language.english,
                                  );
                                  int total = 1;
                                  allSmeGig.forEach((element) {
                                    if (element.status == 2) {
                                      total++;
                                    }
                                  });

                                  return allSmeGig[index].status == 2
                                      ? Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        child: CommonContainer(
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
                                                          padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 8,
                                                              vertical: 8),
                                                          decoration: BoxDecoration(
                                                              color:
                                                              primaryColorLight,
                                                              shape: BoxShape.circle),
                                                          child: CachedNetworkImage(
                                                            height: 20,
                                                            imageUrl: "${imageUrl}${{
                                                              allSmeGig[index]
                                                                  .user!
                                                                  .userDetails!
                                                                  .profileImage
                                                            }}",
                                                            // placeholder: (context, url) => CircularProgressIndicator(),
                                                            errorWidget: (context,
                                                                url, error) =>
                                                                Image.asset(
                                                                    "assets/choose_auth.png"),
                                                          ),
                                                        ),
                                                        SizedBox(width: 5,),
                                                        Text("${allSmeGig[index].projectTitle}", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                                      ],
                                                    ),
                                                    ContainerWithContraints(
                                                      widget: Text("\$${allSmeGig[index].budget}", style: myStyle(10, secondaryColorDark, FontWeight.bold),),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 5,),
                                                Text("${allSmeGig[index].projectDescription}",
                                                  style: myStyle(10, textColorLight, FontWeight.normal),
                                                  maxLines: 3,),
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
                                                      title: Text("$result",style: myStyle(8,textColorLight,FontWeight.w400),),
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
                                                          Text("${allSmeGig[index].jobLocationCity}",style: myStyle(8,textColorLight,FontWeight.w400),),
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
                                        onTap: (){},
                                      ),
                                    ],
                                  ):SizedBox(
                                    height: 0,
                                  );
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 5,);
                                },
                                itemCount: allSmeGig.length,
                              ),
                            ],
                          ),
                        ):SizedBox(
                          height: 1,
                        ),
                      ],
                    ),
                  ),
                ),
                ///Student Order
                Container(

                  color: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child:      SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(

                            width: MediaQuery.of(context).size.width - 5,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(color: textColorLight.withOpacity(0.5)),
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Select what you want to do", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                    SizedBox(height: 5),
                                    SizedBox(
                                        height: 35,
                                        width: MediaQuery.of(context).size.width - 5,
                                        child: InkWell(
                                          onTap: (){},
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text("Post a Gig (single task for 1 person)",style: myStyle(12,Colors.white,FontWeight.w400),),
                                            padding: EdgeInsets.symmetric(vertical: 8),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius: BorderRadius.circular(8)),
                                          ),
                                        )
                                    ),
                                    SizedBox(height: 5),
                                    SizedBox(
                                        height: 35,
                                        width: MediaQuery.of(context).size.width - 5,
                                        child: InkWell(
                                          onTap: (){},
                                          child: Container(
                                            alignment: Alignment.center,
                                            child: Text("Post a project (Multiple gigs w' for multiple people)",style: myStyle(12,primaryColor,FontWeight.w400),),
                                            padding: EdgeInsets.symmetric(vertical: 12),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: primaryColor,
                                                    width:  1
                                                ),
                                                borderRadius: BorderRadius.circular(8)),
                                          ),
                                        )
                                    ),
                                  ]
                              ),
                            )
                        ),
                        SizedBox(height: 5),
                        Container(

                            width: MediaQuery.of(context).size.width - 5,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                border: Border.all(color: textColorLight.withOpacity(0.5)),
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(5))
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Favourite student's profile", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                                    SizedBox(height: 5),
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: EdgeInsets.only(bottom: 5.0),
                                          child: Container(
                                            height: 70,
                                            width: MediaQuery.of(context).size.width - 5,
                                            decoration: BoxDecoration(
                                                border: Border.all(color: textColorLight.withOpacity(0.5)),
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(Radius.circular(5))
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
                                        );
                                      },
                                      itemCount: 3,
                                    ),
                                  ]
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                ),

                /// Students Wallet
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(16, 0,16,6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        //height: 120,
                        width: MediaQuery.of(context).size.width - 5,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(color: textColorLight.withOpacity(0.5)),
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text("MY WALLET", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 88,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.zero,
                                          child: Icon(Icons.currency_bitcoin, size: 15,),
                                        ),
                                        SizedBox(width: 3),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("\$2,589", style: myStyle(12, secondaryColorDark, FontWeight.bold),),
                                            SizedBox(height: 3),
                                            Text("Available Balance", style: myStyle(8, secondaryColorDark, FontWeight.normal),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    height: 50,
                                    width: 85,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.zero,
                                          child: Icon(Icons.currency_bitcoin, size: 15,),
                                        ),
                                        SizedBox(width: 3),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("10", style: myStyle(12, secondaryColorDark, FontWeight.bold),),
                                            SizedBox(height: 3),
                                            Text("Active Orders", style: myStyle(8, secondaryColorDark, FontWeight.normal),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 8),
                                  Container(
                                    height: 50,
                                    width: 85,
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: textColorLight.withOpacity(0.5)),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(Radius.circular(5))
                                    ),
                                    child: Row(
                                      // mainAxisAlignment: MainAxisAlignment.sp,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.zero,
                                          child: Icon(Icons.currency_bitcoin, size: 15,),
                                        ),
                                        SizedBox(width: 3),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text("\$2,589", style: myStyle(12, secondaryColorDark, FontWeight.bold),),
                                            SizedBox(height: 3),
                                            Text("Total Spent", style: myStyle(8, secondaryColorDark, FontWeight.normal),),
                                          ],
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
                      Padding(
                        padding: EdgeInsets.only(top:20),
                        child: Container(
                          //height: 100,
                          width: MediaQuery.of(context).size.width - 5,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: textColorLight.withOpacity(0.5)),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(5))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ADD MONEY", style: myStyle(15, secondaryColorDark, FontWeight.bold),),
                              SizedBox(height: 5),
                              SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width - 5,
                                child: InkWell(
                                  onTap: ((){}),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text("Add Money",style: myStyle(12,Colors.white,FontWeight.w400),),
                                    padding: EdgeInsets.symmetric(vertical: 3),
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius: BorderRadius.circular(8)),
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
        ),
      ),
    );
  }}
