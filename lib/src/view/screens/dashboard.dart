import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:news_app/src/helper/model/news_model.dart';
import 'package:news_app/src/helper/provider/loading_provider.dart';
import 'package:news_app/src/view/screens/Forum/forum_view.dart';
import 'package:news_app/src/view/screens/Interview/interview_vertical.dart';
import 'package:news_app/src/view/screens/Video/video_view.dart';
import 'package:news_app/src/view/screens/all_categories_Details.dart';
import 'package:news_app/src/view/screens/Interview/interview_details.dart';
import 'package:news_app/src/view/screens/articles/article_view.dart';
import 'package:news_app/src/view/screens/electronic/electronic_circuit.dart';
import 'package:news_app/src/view/screens/events/event_view.dart';
import 'package:news_app/src/view/screens/miicrocontroller/microcontroller_view.dart';
import 'package:news_app/src/view/screens/news/news.dart';
import 'package:news_app/src/view/screens/review/review_view.dart';
import 'package:news_app/src/view/screens/tutorials/tutorial_view.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/repo/circuitdigest_controller.dart';
import 'package:news_app/src/helper/model/circui_digest_model.dart';
import 'package:news_app/src/view/screens/dashboardDetails.dart';
import 'package:news_app/src/view/widgets/reusable_widgets.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
Future? interviewsFuture, newsFuture;
bool isInterview = false;
bool isIndustry = false;
bool isProduct = false;
List<String> Product=['Electric Vehicles', 'Drones'];
List<String> Industry=['IoT', 'Electronics Manufacturing',];

  @override
  void initState() {
    super.initState();

    interviewsFuture = getInterviews();
    newsFuture=getNews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<LoadingProvider>(
                    builder: (context, value, _) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                    child:  Column(
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
                            width: MediaQuery.of(context).size.width,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  
                                  reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.15,
                                  clr: value.isNews?
                                  AppColor.lightBlue:AppColor.lightgrey,
                                  onTap: (){
                                  value.boolValue(true,false,false,false,false,false,false,false,false,false);
                                  },
                                  child: Center(child: smallText("News", 
                                  clr: value.isNews?Colors.white:AppColor.darkBlue)),
                                  ),
                                   
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                                    child: reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.25,
                                    clr: value.isINTERVIEW?
                                    AppColor.lightBlue:AppColor.lightgrey,
                                     onTap: (){
                                     
                                      value.boolValue(false,true,false,false,false,false,false,false,false,false);
                                      
                                     },
                                    child: Center(child: smallText("Interview", 
                                    clr:value.isINTERVIEW?
                                     Colors.white:AppColor.darkBlue)),
                                    ),
                                  ),


                                  reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.3,
                                  clr: value.isELECTRON?
                                  AppColor.lightBlue:AppColor.lightgrey,
                                  onTap: (){
                                  value.boolValue(false,false,true,false,false,false,false,false,false,false);
                                  },
                                  child: Center(child: smallText("Electronic Circuits ", 
                                  clr:
                                  value.isELECTRON?Colors.white:AppColor.darkBlue)),
                                  ),

                                  Padding(
                                   padding: const EdgeInsets.symmetric(horizontal:8.0),
                                    child: reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.15,
                                    clr: value.isEVENT?
                                    AppColor.lightBlue:AppColor.lightgrey,
                                    onTap: (){
                                    value.boolValue(false,false,false,true,false,false,false,false,false,false);
                                    },
                                    child: Center(child: smallText("Events ", 
                                    clr: 
                                    value.isEVENT?Colors.white:AppColor.darkBlue)),
                                    ),
                                  ),

                                  reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.25,
                                  clr: value.isFORUM?
                                  AppColor.lightBlue:AppColor.lightgrey,
                                  onTap: (){
                                  value.boolValue(false,false,false,false,true,false,false,false,false,false);
                                  },
                                  child: Center(child: smallText("forum-topic ", 
                                  clr: 
                                  value.isFORUM?Colors.white:AppColor.darkBlue)),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                                    child: reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.25,
                                    clr:value.isMICRO?
                                    AppColor.lightBlue:AppColor.lightgrey,
                                    onTap: (){
                                    value.boolValue(false,false,false,false,false,true,false,false,false,false);
                                    },
                                    child: Center(child: smallText("Microcontroller ", 
                                    clr:
                                    value.isMICRO?Colors.white:AppColor.darkBlue)),
                                    ),
                                  ),
                                  reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.25,
                                  clr: value.isREVIEW?
                                  AppColor.lightBlue:AppColor.lightgrey,
                                  onTap: (){
                                  value.boolValue(false,false,false,false,false,false,true,false,false,false);
                                  },
                                  child: Center(child: smallText("Review ", 
                                  clr: 
                                  value.isREVIEW==true?Colors.white:AppColor.darkBlue)),
                                  ),
                                  Padding(
                                   padding: const EdgeInsets.symmetric(horizontal:8.0),
                                    child: reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.25,
                                    clr: value.isVIDEO?
                                    AppColor.lightBlue:AppColor.lightgrey,
                                    onTap: (){
                                    value.boolValue(false,false,false,false,false,false,false,true,false,false);
                                    },
                                    child: Center(child: smallText("Videos ", 
                                    clr: 
                                    value.isVIDEO?Colors.white:AppColor.darkBlue)),
                                    ),
                                  ),
                                  reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.25,
                                  clr: value.isTUTORIAL?
                                  AppColor.lightBlue:AppColor.lightgrey,
                                  onTap: (){
                                  value.boolValue(false,false,false,false,false,false,false,false,true,false);
                                  },
                                  child: Center(child: smallText("Tutorials ", 
                                  clr:
                                  value.isTUTORIAL?Colors.white:AppColor.darkBlue)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal:8.0),
                                    child: reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.25,
                                    clr:value.isARTICLE?
                                    AppColor.lightBlue:AppColor.lightgrey,
                                    onTap: (){
                                    value.boolValue(false,false,false,false,false,false,false,false,false,true);
                                    },
                                    child: Center(child: smallText("Articles ", 
                                    clr: 
                                    value.isARTICLE?Colors.white:AppColor.darkBlue)),
                                    ),
                                  ),
                                  

                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          
                       value.isINTERVIEW? interviewOption():
                       value.isNews?newsOption():value.isELECTRON? electronicCircuitOption():
                       value.isEVENT?eventOption():
                       value.isFORUM?forumOption(): 
                       value.isMICRO? microOption():value.isREVIEW?reviewOption():
                       value.isVIDEO?videoOption():value.isTUTORIAL?tutorialOption():value.isARTICLE?articleOption():
                        newsOption(),
                      ],
                    ),
                  )
            
            
            ),
          );
        }
      ),
    );
  }

  FutureBuilder<List<Cicuitdigest>> interviewOption() {
    return FutureBuilder<List<Cicuitdigest>>(
                                future: getInterviews(),
                                builder: (context,snapshot) {
                                   if(snapshot.connectionState == ConnectionState.done
           && snapshot.hasData){
                  
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // value.isINTERVIEW==true? 
                              // largeText("Interview")
                              // :value.isNews==true?
                              // largeText("Industry"):value.isPRODUCT==true?
                              // largeText("Product")
                              // :largeText("ALL"),
                              largeText("Interview"),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>InterviewVertical()));
                                    },
                                    child: smallText("view all")),
                                  const Icon(Icons.arrow_forward_ios, color: Colors.red, size: 10,)
                                ],
                              )
                            ],
                          ),
                          // const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                // for(int i=0; i<4; i++)
                                Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  child:
                                    // value.isINTERVIEW? 
                                    Container(
                                        height: MediaQuery.of(context).size.height*0.31,
                                              width:MediaQuery.of(context).size.width ,
                                              // color: Colors.red,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data!.length,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:
                                              // snapshot.data![i].fieldTags!.contains("Interview")?
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: ((context) => InterviewDetails(id: i))));
                                                },
                                                child: Column(
                                                  children: [
                                                    reuableContainer(context,
                                                    hgt: MediaQuery.of(context).size.height*0.2,
                                                    wtd:MediaQuery.of(context).size.width*0.6,
                                                    
                                                    child: 
                                                    
                                                     ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Image.network(snapshot.data![i].fieldImage!.
                                                        replaceAll("/circuitdigest_9/sites/",
                                                          "https://circuitdigest.com/sites/"),
                                                          fit: BoxFit.cover,
                                                          ),
                                                    )
                                                    ),
                                                    
                                                    reuableContainer(context,
                                                    hgt: MediaQuery.of(context).size.height*0.085,
                                                    wtd:MediaQuery.of(context).size.width*0.6,
                                                    clr: Colors.white,
                                                      child: largeText(snapshot.data![i].title!, 
                                                      max: 3
                                                      )),
                                                  ],
                                                ),
                                              )
                                              // :largeText("txt")
                                           
                                           
                                            );
                                          }
                                        ),
                                      ),
                                     
                                ),
                              ],
                            ),),
                          largeText("All Interviews"),
                          const SizedBox(height: 10),
                          reuableContainer(context,
                                  hgt: MediaQuery.of(context).size.height*0.25,
                                  wtd:MediaQuery.of(context).size.height*0.5 ,
                                  child: ClipRRect(
                                    child: Image.network(snapshot.data![0].fieldImage!.
                                                  replaceAll("/circuitdigest_9/sites/",
                                                    "https://circuitdigest.com/sites/"),
                                                    fit: BoxFit.cover,),
                                  )
                                  ),
                                const SizedBox(height: 10),
                        largeText(snapshot.data![0].title!, max: 1),
                        const SizedBox(height: 10),
                        smallText(snapshot.data![0].body!,
                        clr: AppColor.darkBlue,
                        max: 2
                        ),
                         const SizedBox(height: 20),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              largeText("Today, 7:52 PM"),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const DashboardDetail()));
                                },
                                child: Row(
                                  children: [
                                    smallText("read more"),
                                    const Icon(Icons.arrow_forward_ios, color: Colors.red, size: 10,)
                                  ],
                                ))
                            ],
                          ),
                        ],
                      );
                    
                    // }
                  // );
                }
                else{
                  return const Center(
              child: CircularProgressIndicator(),
            );
                }
                }  
              );
  }


}