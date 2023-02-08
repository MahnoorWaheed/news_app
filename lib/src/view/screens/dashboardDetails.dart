import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/src/view/screens/all_categories_Details.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/repo/circuitdigest_controller.dart';
import 'package:news_app/src/helper/model/circui_digest_model.dart';
import 'package:news_app/src/view/widgets/reusable_widgets.dart';
import 'package:provider/provider.dart';

class DashboardDetail extends StatefulWidget {
  const DashboardDetail({super.key});

  @override
  State<DashboardDetail> createState() => _DashboardDetailState();
}

class _DashboardDetailState extends State<DashboardDetail> {
Future? interviewsFuture;
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
          child: FutureBuilder<List<Cicuitdigest>>(
           future: getInterviews(),
              builder: (context,snapshot) {
                 if(snapshot.connectionState == ConnectionState.done
             && snapshot.hasData){
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
                          children: [
                            IconButton(onPressed: (){
                              Navigator.pop(context);
                            }, icon: const Icon(Icons.arrow_back, 
                            color:AppColor.darkBlue
                            )),
                           
                            //  largeText("Lorem Ipsum", size: 17)
                          ],
                        ),
                         Container(
                                          height: MediaQuery.of(context).size.height*0.9,
                                                width:MediaQuery.of(context).size.width ,
                                                
                                          child: ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: snapshot.data!.length,
                                            itemBuilder: (context, i) {
                                              return Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child:GestureDetector(
                                                  onTap: () =>  Navigator.of(context).push(MaterialPageRoute(
                                                      builder: ((context) => AllCategoryDetails(id: i)))),
                                                  child: Column(
                                                    children: [
                                                      reuableContainer(context,
                                                      hgt: MediaQuery.of(context).size.height*0.2,
                                                      wtd:MediaQuery.of(context).size.width*0.9,
                                                      
                                                      child: 
                                                      
                                                       ClipRRect(
                                                        borderRadius: BorderRadius.circular(10),
                                                        child: Image.network(snapshot.data![i].fieldImage!.
                                                          replaceAll("/circuitdigest_9/sites/",
                                                            "https://circuitdigest.com/sites/"),
                                                            fit: BoxFit.cover,
                                                            ),
                                                      )),
                                                      
                                                      reuableContainer(context,
                                                      hgt: MediaQuery.of(context).size.height*0.085,
                                                      wtd:MediaQuery.of(context).size.width*0.9,
                                                      clr: Colors.white,
                                                        child: largeText(snapshot.data![i].title!,)),
                                                    ],
                                                  ),
                                                )
                                             
                                             
                                              );
                                            }
                                          ),
                                        )
                                       
                                       
                                    
                  ],
                ),
              );
            }

            else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
              }
          ),
        ),
      ),
    );
  }
}