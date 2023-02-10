import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knotters/http/custome_http.dart';
import 'package:knotters/model/sme_gig_model.dart';
import 'package:knotters/provider/gig_provider.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';
import 'package:provider/provider.dart';
import 'package:z_time_ago/z_time_ago.dart';

class SmeGigsPage extends StatefulWidget {
  static const String id = 'GigsPage';

  const SmeGigsPage({Key? key}) : super(key: key);

  @override
  State<SmeGigsPage> createState() => _SmeGigsPageState();
}

class _SmeGigsPageState extends State<SmeGigsPage> {
  List<SmeGigModel> allSmeGig = [];

  fetchAllSmeGigs() async {
    await Provider.of<GigProvider>(context, listen: false).getAllSmeGig();
    setState(() {});
    print("xxxxxxxxxxxxx${allSmeGig.length}");
  }

  @override
  void initState() {
    fetchAllSmeGigs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    allSmeGig = Provider.of<GigProvider>(
      context,
    ).allSmeGigList;

    return SafeArea(
      child: Scaffold(
        backgroundColor: scaffoldColor,
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ACTIVE GIG'S ORDER",
                        style: myStyle(20, Colors.black87, FontWeight.w700),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      allSmeGig.isEmpty
                          ? SizedBox(
                              height: 300,
                              child: Center(
                                child: Text(
                                  "No Gigs Found",
                                  style: myStyle(16, Colors.black54),
                                ),
                              ),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: allSmeGig.length,
                              itemBuilder: (context, index) {
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
                                    ? Container(
                                        margin:
                                            EdgeInsets.symmetric(vertical: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            border: Border.all(
                                                color: primaryColor,
                                                width: .8)),
                                        padding: EdgeInsets.only(top: 8),
                                        width: double.infinity,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 8),
                                                    decoration: BoxDecoration(
                                                        color:
                                                            primaryColorLight,
                                                        shape: BoxShape.circle),
                                                    child: CachedNetworkImage(
                                                      height: 50,
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
                                                  flex: 3,
                                                ),
                                                SizedBox(
                                                  width: 6,
                                                ),
                                                Expanded(
                                                    flex: 10,
                                                    child: Column(
                                                      children: [
                                                        Text(
                                                          "${allSmeGig[index].projectTitle}",
                                                          style: myStyle(
                                                              18,
                                                              Colors.black87,
                                                              FontWeight.w700),
                                                        ),
                                                        SizedBox(
                                                          height: 6,
                                                        ),
                                                        Text(
                                                          "$result",
                                                          style: myStyle(12,
                                                              Colors.black87),
                                                          maxLines: 2,
                                                        ),
                                                        SizedBox(
                                                          height: 6,
                                                        ),
                                                        Text(
                                                          "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups",
                                                          style: myStyle(
                                                              14,
                                                              Colors.black54,
                                                              FontWeight.w600),
                                                          maxLines: 3,
                                                        ),
                                                      /*  Text(
                                                          "${allSmeGig[index].projectDescription.toString()}",
                                                          style: myStyle(
                                                              16,
                                                              Colors.black54,
                                                              FontWeight.w700),
                                                          maxLines: 3,
                                                        ),*/
                                                        /*  Html(
                                                data: '${allSmeGig[index].projectDescription}',
                                                style: {
                                                  '#': Style(
                                                    fontSize: FontSize(16),
                                                    maxLines: 2,
                                                    lineHeight: LineHeight.number(0),
                                                    textOverflow: TextOverflow.ellipsis,
                                                      padding: EdgeInsets.symmetric(vertical: 0),

                                                  ),
                                                }),*/
                                                      ],
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                    ))
                                              ],
                                            ),
                                            ExpansionTile(

                                              leading: Text(
                                                'Offer from Students (${allSmeGig[index].applyJobs!.length ?? 0} Offers)',
                                                style:
                                                    myStyle(14, Colors.black54),
                                              ),
                                              title: Text(""),
                                              trailing: Icon(
                                                Icons
                                                    .arrow_drop_down_circle_outlined,
                                                color: primaryColor,
                                              ),
                                              collapsedTextColor:
                                                  Colors.black54,
                                              textColor: Colors.black54,
                                              expandedAlignment:
                                                  Alignment.topLeft,
                                              tilePadding: EdgeInsets.symmetric(
                                                  vertical: 0, horizontal: 20),
                                              collapsedBackgroundColor:
                                                  Colors.transparent,
                                              childrenPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 0,
                                                      horizontal: 10),
                                              iconColor: primaryColor,
                                              backgroundColor:
                                                  Colors.transparent,
                                              children: <Widget>[
                                                ListView.builder(
                                                    itemBuilder:
                                                    (context, i) {
                                                  return Container(margin: EdgeInsets.only(bottom: 8),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(6),
                                                      border: Border.all(color: primaryColorLight
                                                      )
                                                    ),
                                                    padding: EdgeInsets.symmetric(horizontal: 6,vertical: 0),
                                                    child: ExpansionTile(

                                                     trailing: Card(
                                                       child: Padding(
                                                         padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                                                         child: Column(
                                                           mainAxisAlignment: MainAxisAlignment.center,
                                                           children: [
                                                             Text("4.9",style: myStyle(16,Colors.black87,FontWeight.w600),),
                                                             Icon(Icons.star,color: primaryColor,size: 20,)
                                                           ],
                                                         ),
                                                       )
                                                     ),
                                                      subtitle: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text( '${allSmeGig[index].applyJobs![i].freelancerDetails!.name} ',style: myStyle(13,Colors.black54,FontWeight.w600)),
                                                          SizedBox(height: 2,),
                                                          Text( 'Graphics',style: myStyle(13,Colors.black54,FontWeight.w600)),
                                                        ],
                                                      ),
                                                      leading: CircleAvatar(
                                                        backgroundImage: NetworkImage("${baseUrl}${allSmeGig[index].applyJobs![i].freelancerDetails!.userDetails!.profileImage}"),
                                                      ),
                                                      title: Text(
                                                          '${allSmeGig[index].applyJobs![i].freelancerDetails!.name}',style: myStyle(16,Colors.black87,FontWeight.w600),),

                                                      children: [
                                                          Row(

                                                            children: [
                                                              OutlinedButton(
                                                                style: OutlinedButton.styleFrom(
                                                                  side: BorderSide( width: 0.6, color: primaryColor),
                                                                ),
                                                                onPressed: (){}, child: Text("View Profile",style: myStyle(14,primaryColor,FontWeight.w600),

                                                              ),

                                                              ),
                                                              OutlinedButton(style: OutlinedButton.styleFrom(
                                                                side: BorderSide(  width: 0.6, color: primaryColor),
                                                              ),onPressed: (){}, child: Text("Hire & Make Payment",style: myStyle(14,primaryColor,FontWeight.w600),))
                                                            ],
                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                          ),


                                                      ], )
                                                  );
                                                },
                                                shrinkWrap: true,
                                                  itemCount: allSmeGig[index].applyJobs!.length,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    : SizedBox(
                                        height: 0,
                                      );
                              })
                    ],
                  ),
                ),
                allSmeGig.isNotEmpty
                    ? Container(
                        margin: EdgeInsets.symmetric(vertical: 20),
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ORDER HISTORY",
                              style:
                                  myStyle(20, Colors.black87, FontWeight.w700),
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: allSmeGig.length,
                                itemBuilder: (context, index) {
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
                                      ? Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 6),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color: primaryColor,
                                                  width: .8)),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12),
                                          width: double.infinity,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                /* child: CircleAvatar(
                                backgroundImage: NetworkImage("${imageUrl}${{allSmeGig[index].user!.userDetails!.profileImage}}",),
                                maxRadius: 25,
                              ),*/
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 8,
                                                      vertical: 8),
                                                  child: CachedNetworkImage(
                                                    imageUrl: "${imageUrl}${{
                                                      allSmeGig[index]
                                                          .user!
                                                          .userDetails!
                                                          .profileImage
                                                    }}",
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
                                                        "${allSmeGig[index].projectTitle}",
                                                        style: myStyle(
                                                            20,
                                                            Colors.black87,
                                                            FontWeight.w700),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          vertical: 4,
                                                        ),
                                                      ),
                                                      Text(
                                                        "$result",
                                                        style: myStyle(
                                                            16, Colors.black87),
                                                        maxLines: 2,
                                                      ),
                                                      Text(
                                                        "${{
                                                          allSmeGig[index]
                                                              .projectDescription
                                                        }}",
                                                        style: myStyle(
                                                            16, Colors.black54),
                                                        maxLines: 2,
                                                      )
                                                      // Text("Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled i",style: myStyle(12,Colors.black54,),
                                                      // maxLines: 2,
                                                      //),
                                                    ],
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                  ))
                                            ],
                                          ),
                                        )
                                      : SizedBox(
                                          height: 0,
                                        );
                                }),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: 1,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
