import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knotters/http/gig_http.dart';
import 'package:knotters/model/student_gig_model.dart';
import 'package:knotters/provider/gig_provider.dart';
import 'package:knotters/screen/profile/students_profile_page.dart';
import 'package:knotters/utlits/utlits.dart';
import 'package:knotters/widget/const.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:z_time_ago/z_time_ago.dart';

class StudentGigsPage extends StatefulWidget {
  const StudentGigsPage({Key? key}) : super(key: key);

  @override
  _StudentGigsPageState createState() => _StudentGigsPageState();
}

class _StudentGigsPageState extends State<StudentGigsPage> {
  String pageNo = "1";
  List<Data> allStudentGigList = [];

  fetchAllSmeGigs() async {
    await Provider.of<GigProvider>(context, listen: false)
        .getAllStudentGig(pageNo);
  }

  @override
  void initState() {
    fetchAllSmeGigs();
    super.initState();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    allStudentGigList = Provider.of<GigProvider>(
      context,
    ).allStudentGigList;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      opacity: 0.5,
      blur: 0.5,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: scaffoldColor,
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    "EXPLORE ALL GIGS",
                    style: myStyle(20, Colors.black87, FontWeight.w700),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: allStudentGigList.isEmpty
                        ? Container(
                            height: MediaQuery.of(context).size.height * 0.65,
                            child: Center(
                              child: Text(
                                "No Gigs Found",
                                style: myStyle(16, Colors.black54),
                              ),
                            ),
                          )
                        : ListView.builder(
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: allStudentGigList.length,
                            itemBuilder: (context, index) {
                              allStudentGigList.forEach((element) {
                                int total = 1;
                                if (element.status == 1) {
                                  total++;
                                }
                              });
                              var result = ZTimeAgo().getTimeAgo(
                                date: DateTime.parse(allStudentGigList[index]
                                    .createdAt
                                    .toString()),
                                language: Language.english,
                              );
                              return allStudentGigList[index].status == 1
                                  ? /*Container(
                                        margin: EdgeInsets.symmetric(vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12),
                                            border: Border.all(
                                                color: primaryColor, width: .8)),
                                        padding: EdgeInsets.symmetric(vertical: 8),
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 8, vertical: 8),
                                                decoration: BoxDecoration(
                                                    color: primaryColorLight,
                                                    shape: BoxShape.circle),
                                                child: CachedNetworkImage(
                                                  height: 50,
                                                  imageUrl: "",
                                                  // placeholder: (context, url) => CircularProgressIndicator(),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Image.asset(
                                                          "assets/choose_auth.png"),
                                                ),
                                              ),
                                              flex: 3,
                                            ),
                                            Expanded(
                                                flex: 9,
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "${allStudentGigList[index].projectTitle}",
                                                      style: myStyle(
                                                          20,
                                                          Colors.black87,
                                                          FontWeight.w700),
                                                    ),
                                                    SizedBox(
                                                      height: 6,
                                                    ),
                                                    Text(
                                                      "$result",
                                                      style:
                                                          myStyle(16, Colors.black87),
                                                      maxLines: 2,
                                                    ),
                                                    SizedBox(
                                                      height: 6,
                                                    ),
                                                    Text(
                                                      "${allStudentGigList[index].projectDescription.toString()}",
                                                      style: myStyle(
                                                          16,
                                                          Colors.black54,
                                                          FontWeight.w700),
                                                      maxLines: 3,
                                                    ),
                                                    */ /* Html(
                                            data: '${  allStudentGigList[index].projectDescription}',
                                            style: {
                                              '#': Style(
                                                fontSize: FontSize(16),
                                                maxLines: 2,
                                                textOverflow: TextOverflow.ellipsis,
                                              ),
                                            }),*/ /*
                                                  ],
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                ))
                                          ],
                                        ),
                                      )*/
                                  Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          border:
                                              Border.all(color: primaryColor)),
                                      margin: EdgeInsets.only(bottom: 16),
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
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
                                                      height: 25,
                                                      imageUrl: "",
                                                      // placeholder: (context, url) => CircularProgressIndicator(),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                              "assets/choose_auth.png"),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "${allStudentGigList[index].projectTitle}",
                                                    style: myStyle(
                                                        15,
                                                        secondaryColorDark,
                                                        FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              ContainerWithContraints(
                                                widget: Text(
                                                  "  \$${allStudentGigList[index].budget}  ",
                                                  style: myStyle(
                                                      13,
                                                      secondaryColorDark,
                                                      FontWeight.bold),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.",
                                            style: myStyle(11, textColorLight,
                                                FontWeight.normal),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              BorderButton(
                                                onTap: (() {}),
                                                title: Text(
                                                  "Graphic Design",
                                                  style: myStyle(
                                                      10,
                                                      textColorLight,
                                                      FontWeight.w400),
                                                ),
                                                height: 30,
                                                width: 80,
                                              ),
                                              BorderButton(
                                                onTap: (() {}),
                                                title: Text(
                                                  "$result",
                                                  style: myStyle(
                                                      10,
                                                      textColorLight,
                                                      FontWeight.w400),
                                                  maxLines: 1,
                                                ),
                                                height: 30,
                                                width: 80,
                                              ),
                                              BorderButton(
                                                onTap: (() {}),
                                                title: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Icon(
                                                      Icons.location_on,
                                                      color: textColorLight,
                                                      size: 12,
                                                    ),
                                                    Text(
                                                      "Abu Dhabi",
                                                      style: myStyle(
                                                          10,
                                                          textColorLight,
                                                          FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                                height: 30,
                                                width: 60,
                                              ),
                                              BorderButton(
                                                onTap: (() {}),
                                                title: Text(
                                                  "Single Gig",
                                                  style: myStyle(
                                                      10,
                                                      textColorLight,
                                                      FontWeight.w400),
                                                ),
                                                height: 30,
                                                width: 60,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          MaterialButton(
                                            onPressed: () async {
                                              setState(() {
                                                isLoading = true;
                                              });
                                              var responce = await GigHttpRequest
                                                  .studentApplyGig(
                                                      "${allStudentGigList[index].jobPostSlug}");
                                              print(
                                                  "responce issssss$responce");

                                              setState(() {
                                                isLoading = false;
                                              });
                                              if(responce["success"]!=null){
                                                 congratulationsDialog(ctx: context,title: "Congratulations !",subTitle: "You’ve successfully applied to this gig. You’ll hear back from the company if its assigned to you. If not - don't be discouraged, continue applying to othergigs. You got this!");

                                              }
                                              else {
                                                showSnackBar(context: context, content: "Something Wrong, Pls try again");
                                              }


                                            },
                                            color: primaryColor,
                                            child: Text(
                                              "Apply To This GIG",
                                              style: myStyle(14, Colors.white,
                                                  FontWeight.w600),
                                            ),
                                            minWidth: double.infinity,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                          )
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      height: 0,
                                    );
                            }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
