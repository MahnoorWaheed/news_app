import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/repo/circuitdigest_controller.dart';
import 'package:news_app/src/helper/model/circui_digest_model.dart';
import 'package:news_app/src/helper/model/forum_model.dart';
import 'package:news_app/src/helper/model/news_model.dart';
import 'package:news_app/src/helper/provider/loading_provider.dart';
import 'package:news_app/src/view/screens/Forum/forum_details.dart';
import 'package:news_app/src/view/screens/all_categories_Details.dart';
import 'package:news_app/src/view/screens/Interview/interview_details.dart';
import 'package:news_app/src/view/screens/news/news_details.dart';
import 'package:news_app/src/view/widgets/reusable_widgets.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:provider/provider.dart';

class ForumVerticleList extends StatefulWidget {
  const ForumVerticleList({super.key});

  @override
  State<ForumVerticleList> createState() => _ForumVerticleListState();
}

class _ForumVerticleListState extends State<ForumVerticleList> {
  Future? newsFuture;
  @override
  void initState() {
    // TODO: implement initState
    newsFuture = getForum();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child:  FutureBuilder<List<ForumModel>>(
            future: getForum(),
            builder: (context,snapshot) {
              if(snapshot.connectionState == ConnectionState.done
             && snapshot.hasData){
              return Consumer<LoadingProvider>(
                builder: (context, value, _) {
                  return Column(
                                        children: [
                                          // for(int i=0; i<4; i++)
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
                                                    // color: Colors.red,
                                              child: ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: snapshot.data!.length,
                                                itemBuilder: (context, i) {
                                                  return Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child:
                                                    GestureDetector(
                                                      onTap: (){
                                                        Navigator.of(context).push(MaterialPageRoute(
                                                          builder: ((context) => ForumDetails(id: i))));
                                                      },
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
                                                          )
                                                          ),
                                                          
                                                          reuableContainer(context,
                                                          hgt: MediaQuery.of(context).size.height*0.085,
                                                          wtd:MediaQuery.of(context).size.width*0.9,
                                                          clr: Colors.white,
                                                            child: largeText(snapshot.data![i].title!, 
                                                           
                                                            )),
                                                        ],
                                                      ),
                                                    )
                                                 
                                                 
                                                  );
                                                }
                                              ),
                                            ),
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
                            
                            
        ),
      ),
    );
  }
}