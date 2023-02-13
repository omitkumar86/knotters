import 'package:flutter/material.dart';
import 'package:knotters/screen/profile/students_profile_page.dart';
import 'package:knotters/widget/const.dart';
import 'package:knotters/widget/custome_button.dart';

class NewsAndEventPage extends StatefulWidget {
  const NewsAndEventPage({Key? key}) : super(key: key);

  @override
  State<NewsAndEventPage> createState() => _NewsAndEventPageState();
}

class _NewsAndEventPageState extends State<NewsAndEventPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryWhite,
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: AppbarButton(onTap: (){
              Navigator.of(context).pop();
            }),
          ),
          backgroundColor: primaryWhite,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("NEWS & EVENTS", style: myStylePoppins(16, primaryColor),),
                Divider(),
                SizedBox(height: 10,),
                Container(
                  width: double.infinity,
                  child: Column(
                    children: [
                      ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context,index){
                        return Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 133,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: primaryBoxColor,
                              ),
                            ),
                          ],
                        );
                      }, separatorBuilder: (context,index)=>SizedBox(height: 10,), itemCount: 5)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
