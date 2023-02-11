import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/repo/circuitdigest_controller.dart';
import 'package:news_app/src/helper/model/circui_digest_model.dart';
import 'package:news_app/src/helper/model/news_model.dart';
import 'package:news_app/src/helper/model/review_model.dart';
import 'package:news_app/src/view/widgets/reusable_widgets.dart';
import 'package:news_app/utils/app_color.dart';

class ReviewDetails extends StatefulWidget {
  int id;
   ReviewDetails({super.key, required this.id});

  @override
  State<ReviewDetails> createState() => _ReviewDetailsState();
}

class _ReviewDetailsState extends State<ReviewDetails> {
 Future? newsFuture;
  NewsModel? newsModel;

  @override
  void initState() {
    // TODO: implement initState
     newsFuture = getReview();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder<List<ReviewModel>>(
             future: getReview(),
           builder: (context,snapshot) {
             if(snapshot.connectionState == ConnectionState.done
               && snapshot.hasData){
              return Column(
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
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ClipRRect(
                             borderRadius: BorderRadius.circular(10),
                            child: Image.network(snapshot.data![widget.id].fieldImage!.
                              replaceAll("/circuitdigest_9/sites/",
                               "https://circuitdigest.com/sites/"),
                                   fit: BoxFit.cover,
                                    ),
                    ),
                 ),
                  reuableContainer(context,
                      hgt: MediaQuery.of(context).size.height*0.08,
                      wtd:MediaQuery.of(context).size.width*0.95,
                       clr: Colors.white,
                       child: largeText(snapshot.data![widget.id].title!)),
                     
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: HtmlWidget(snapshot.data![widget.id].body!
                          .
                        replaceAll("/sites/", "https://circuitdigest.com/sites/"),
                        textStyle: GoogleFonts.poppins(),
                       ),
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
        ),
      ),
    );
  }
}