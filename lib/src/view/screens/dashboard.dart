import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:news_app/core/app_color.dart';
import 'package:news_app/src/helper/controller/circuitdigest_controller.dart';
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
Future? interviewsFuture;
  @override
  void initState() {
    super.initState();

    interviewsFuture = getInterviews();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: 
              
              SingleChildScrollView(
                child:  FutureBuilder<List<Cicuitdigest>>(
                                  future: getInterviews(),
                                  builder: (context,snapshot) {
                                     if(snapshot.connectionState == ConnectionState.done
             && snapshot.hasData){
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
                          width: MediaQuery.of(context).size.width*0.55,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              reuableContainer(context,wtd: 40,
                              clr: AppColor.lightBlue,
                              child: Center(child: smallText("ALL", clr: Colors.white))
                              ),
                              reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.2,
                              clr: AppColor.lightgrey,
                              child: Center(child: smallText("Product", 
                              clr: AppColor.darkBlue)),
                              ),
                               reuableContainer(context,wtd: MediaQuery.of(context).size.width*0.2,
                              clr: AppColor.lightgrey,
                              child: Center(child: smallText("Industry", 
                              clr: AppColor.darkBlue)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            largeText("Editor's Pick"),
                            Row(
                              children: [
                                smallText("view all"),
                                const Icon(Icons.arrow_forward_ios, color: Colors.red, size: 10,)
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              // for(int i=0; i<4; i++)
                              Padding(
                                padding: const EdgeInsets.all(0.0),
                                child:
                                   Container(
                                      height: MediaQuery.of(context).size.height*0.2,
                                            width:MediaQuery.of(context).size.width ,
                                      child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data!.length,
                                        itemBuilder: (context, i) {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: reuableContainer(context,
                                            hgt: MediaQuery.of(context).size.height*0.2,
                                            wtd:MediaQuery.of(context).size.width*0.6,
                                            // child: 

                                            // ClipRRect(
                                            //   borderRadius: BorderRadius.circular(10),
                                            //   child: Image.network(snapshot.data![i].fieldImage!.
                                            //     replaceAll("/circuitdigest_9/sites/",
                                            //       "https://circuitdigest.com/sites/"),
                                            //       fit: BoxFit.cover,
                                            //       ),
                                            // )
                                            ),
                                          );
                                        }
                                      ),
                                    )
                                
                              
                              ),
                            ],
                          ),
                        ),
                        largeText("All News"),
                        const SizedBox(height: 10),
                        reuableContainer(context,
                                hgt: MediaQuery.of(context).size.height*0.25,
                                wtd:MediaQuery.of(context).size.height*0.55 ,
                                child: ClipRRect(
                                  child: Image.network(snapshot.data![0].fieldImage!.
                                                replaceAll("/circuitdigest_9/sites/",
                                                  "https://circuitdigest.com/sites/"),
                                                  fit: BoxFit.cover,),
                                )
                                ),
                              const SizedBox(height: 10),
                      largeText(snapshot.data![0].title!),
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