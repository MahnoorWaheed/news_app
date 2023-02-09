import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:news_app/src/helper/provider/loading_provider.dart';
import 'package:news_app/src/view/screens/Interview/interview_vertical.dart';
import 'package:news_app/src/view/screens/all_categories_Details.dart';
import 'package:news_app/src/view/screens/Interview/interview_details.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/repo/circuitdigest_controller.dart';
import 'package:news_app/src/helper/model/circui_digest_model.dart';
import 'package:news_app/src/view/screens/dashboardDetails.dart';
import 'package:news_app/src/view/widgets/reusable_widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class NewsTab extends StatefulWidget {
  const NewsTab({super.key});

  @override
  State<NewsTab> createState() => _NewsTabState();
}

class _NewsTabState extends State<NewsTab> {
Future? newsFuture;
bool isInterview = false;
bool isIndustry = false;
bool isProduct = false;
List<String> Product=['Electric Vehicles', 'Drones'];
List<String> Industry=['IoT', 'Electronics Manufacturing',];

  @override
  void initState() {
    super.initState();

    newsFuture = getNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: 
              
              SingleChildScrollView(
                child:  FutureBuilder<List<Cicuitdigest>>(
                                  future: getNews(),
                                  builder: (context,snapshot) {
                                     if(snapshot.connectionState == ConnectionState.done
             && snapshot.hasData){
                    return Consumer<LoadingProvider>(
                      builder: (context, value, _) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                IconButton(onPressed: (){}, icon: const Icon(Icons.menu, 
                                color:AppColor.darkBlue
                                )),
                                const SizedBox(width: 35,),
                                reuableContainer(context,
                                child: Center(
                                  child: smallText("Search", clr: AppColor.darkBlue),
                                )),
                              ],
                            ),
                            
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              width: MediaQuery.of(context).size.width*0.5,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  reuableContainer(context,wtd: 40,
                                  clr:value.isNews==false&&value.isINTERVIEW==false&&value.isPRODUCT==false?
                                   AppColor.lightBlue:AppColor.lightgrey,
                                  onTap: (){
                                  value.boolValue(false, false, false);
                                  },
                                  child: Center(child: smallText("ALL", clr:value.isNews==false&&value.isINTERVIEW==false&&value.isPRODUCT==false? Colors.white:AppColor.darkBlue))
                                  ),
                                  reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.15,
                                  clr: value.isNews==false&&value.isINTERVIEW==false&&value.isPRODUCT==true?AppColor.lightBlue:AppColor.lightgrey,
                                  onTap: (){
                                  value.boolValue(false, true, false);
                                  },
                                  child: Center(child: smallText("News", 
                                  clr: value.isNews==false&&value.isINTERVIEW==false&&
                                  value.isPRODUCT==true?Colors.white:AppColor.darkBlue)),
                                  ),
                                 
                                  reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.2,
                                  clr: value.isNews==false&&value.isINTERVIEW==true&&value.isPRODUCT==false?AppColor.lightBlue:AppColor.lightgrey,
                                   onTap: (){
                                   
                                    value.boolValue(true, false, false);
                                    
                                   },
                                  child: Center(child: smallText("Interview", 
                                  clr:value.isNews==false&&value.isINTERVIEW==true&&value.isPRODUCT==false? Colors.white:AppColor.darkBlue)),
                                  ),
                                ],
                              ),
                            ),
                          //  newsSection(context, value, snapshot),
                          ],
                        );
                      }
                    );
                  }
                  else{
                    return const Center(
                child: CircularProgressIndicator(),
              );
                  }
                  }  
                ),
              )
        ),
      ),
    );
  }




}