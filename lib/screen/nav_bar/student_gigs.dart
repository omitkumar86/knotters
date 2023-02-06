import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knotters/model/student_gig_model.dart';
import 'package:knotters/provider/gig_provider.dart';
import 'package:knotters/widget/const.dart';
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

  @override
  Widget build(BuildContext context) {
    allStudentGigList = Provider.of<GigProvider>(
      context,
    ).allStudentGigList;
    return SafeArea(
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
                    height: MediaQuery.of(context).size.height*0.65,
                          child: Center(
                            child: Text(
                              "No Gigs Found",
                              style: myStyle(16, Colors.black54),
                            ),
                          ),
                        )
                      : ListView.builder(
                          // physics: NeverScrollableScrollPhysics(),
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
                              date: DateTime.parse(
                                  allStudentGigList[index].createdAt.toString()),
                              language: Language.english,
                            );
                            return allStudentGigList[index].status == 1
                                ? Container(
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
                                                /* Html(
                                        data: '${  allStudentGigList[index].projectDescription}',
                                        style: {
                                          '#': Style(
                                            fontSize: FontSize(16),
                                            maxLines: 2,
                                            textOverflow: TextOverflow.ellipsis,
                                          ),
                                        }),*/
                                              ],
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                            ))
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
    );
  }
}
