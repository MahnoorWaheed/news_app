import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
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
                               width:MediaQuery.of(context).size.width*0.98 ,
                          child: ListView.builder(
                            itemBuilder: (context,i) {
                              return Column(
                                children: [
                                    HtmlWidget(snapshot.data![i].title!.
                                  replaceAll("/sites/", "https://circuitdigest.com/sites/"),
                                  textStyle: GoogleFonts.poppins(fontWeight: FontWeight.w700),
                                  ),
                                  HtmlWidget(snapshot.data![i].body!.
                                  replaceAll("/sites/", "https://circuitdigest.com/sites/"),
                                  textStyle: GoogleFonts.poppins(),
                                  )
                                 
                                ],
                              );
                            }
                          ),
                        ),
                         const SizedBox(height: 10),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        smallText("Jobit Joseph"),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const DashboardDetail()));
                          },
                          child: smallText("Today, 7:52"))
                      ],
                    ),
                     const SizedBox(height: 10),
                    // smallText("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\nIt is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).",
                    smallText("",
                    clr: AppColor.darkBlue, max: 20
                    
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