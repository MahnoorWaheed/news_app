import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/repo/circuitdigest_controller.dart';
import 'package:news_app/src/helper/model/news_model.dart';
import 'package:news_app/src/helper/model/review_model.dart';
import 'package:news_app/src/helper/model/tutorial_model.dart';
import 'package:news_app/src/helper/model/videos_model.dart';
import 'package:news_app/src/view/screens/Interview/interview_details.dart';
import 'package:news_app/src/view/screens/Interview/interview_vertical.dart';
import 'package:news_app/src/view/screens/Video/video_details.dart';
import 'package:news_app/src/view/screens/Video/video_verticle.dart';
import 'package:news_app/src/view/screens/dashboardDetails.dart';
import 'package:news_app/src/view/screens/news/new_verticle_list.dart';
import 'package:news_app/src/view/screens/news/news_details.dart';
import 'package:news_app/src/view/screens/review/review_details.dart';
import 'package:news_app/src/view/screens/review/review_vert.dart';
import 'package:news_app/src/view/screens/tutorials/tutorial_details.dart';
import 'package:news_app/src/view/screens/tutorials/tutorial_vertic.dart';
import 'package:news_app/src/view/widgets/reusable_widgets.dart';
import 'package:news_app/utils/app_color.dart';


FutureBuilder<List<TutorialModel>> tutorialOption(List<dynamic> _searchResults, bool onsubmit) {
    return FutureBuilder<List<TutorialModel>>(
                                future: getTutorial(),
                                builder: (context,snapshot) {
                                   if(snapshot.connectionState == ConnectionState.done
           && snapshot.hasData){
                  
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                             
                              largeText("Tutorials"),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>TutorialVerticle()));
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
                                   onsubmit==true? Container(
                                        height: MediaQuery.of(context).size.height*0.31,
                                              width:MediaQuery.of(context).size.width ,
                                              // color: Colors.red,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                          _searchResults.length,
                                          //  snapshot.data!.length,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:
                                              // snapshot.data![i].fieldTags!.contains("Interview")?
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: ((context) => TutorialDetails(id: i))));
                                                },
                                                child: Column(
                                                  children: [
                                                    reuableContainer(context,
                                                    hgt: MediaQuery.of(context).size.height*0.2,
                                                    wtd:MediaQuery.of(context).size.width*0.6,
                                                    
                                                    child: 
                                                    
                                                     ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Image.network(
                                                         _searchResults[i]["field_image"].
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
                                                      child: largeText(
                                                        _searchResults[i]["title"], 
                                                      max: 3
                                                      )),
                                                  ],
                                                ),
                                              )
                                              // :largeText("txt")
                                           
                                           
                                            );
                                          }
                                        ),
                                      )
                                      :
                                    Container(
                                        height: MediaQuery.of(context).size.height*0.31,
                                              width:MediaQuery.of(context).size.width ,
                                              // color: Colors.red,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                          // onsubmit==true? _searchResults.length:
                                           snapshot.data!.length,
                                          itemBuilder: (context, i) {
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child:
                                              // snapshot.data![i].fieldTags!.contains("Interview")?
                                              GestureDetector(
                                                onTap: (){
                                                  Navigator.of(context).push(MaterialPageRoute(
                                                    builder: ((context) => TutorialDetails(id: i))));
                                                },
                                                child: Column(
                                                  children: [
                                                    reuableContainer(context,
                                                    hgt: MediaQuery.of(context).size.height*0.2,
                                                    wtd:MediaQuery.of(context).size.width*0.6,
                                                    
                                                    child: 
                                                    
                                                     ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Image.network(
                                                        // onsubmit==true? _searchResults[i]["field_image"]:
                                                        snapshot.data![i].fieldImage!.
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
                                                      child: largeText(
                                                        // onsubmit==true? _searchResults[i]["title"]:
                                                        snapshot.data![i].title!, 
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
                          largeText("All Tutorials"),
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
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const TutorialVerticle()));
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

