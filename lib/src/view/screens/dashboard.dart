import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/app_color.dart';
import 'package:news_app/src/helper/controller/circuitdigest_controller.dart';
import 'package:news_app/src/view/screens/dashboardDetails.dart';
import 'package:news_app/src/view/widgets/reusable_widgets.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Consumer<CircuitProvider>(
            builder: (context, value, _) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.menu, 
                      color:AppColor.darkBlue
                      )),
                      SizedBox(width: 35,),
                      reuableContainer(context,
                      child: Center(
                        child: smallText("Search", clr: AppColor.darkBlue),
                      )),
                    ],
                  ),
                  
                  Container(
                    margin: EdgeInsets.only(top: 20),
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
                  SizedBox(height: 20),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      largeText("Editor's Pick"),
                      Row(
                        children: [
                          smallText("view all"),
                          Icon(Icons.arrow_forward_ios, color: Colors.red, size: 10,)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for(int i=0; i<4; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: reuableContainer(context,
                          hgt: MediaQuery.of(context).size.height*0.2,
                          wtd:MediaQuery.of(context).size.height*0.35 
                          ),
                        ),
                      ],
                    ),
                  ),
                  largeText("All News"),
                  SizedBox(height: 10),
                  reuableContainer(context,
                          hgt: MediaQuery.of(context).size.height*0.25,
                          wtd:MediaQuery.of(context).size.height*0.55 ,
                          child: ClipRRect(
                            child: Image.asset("${value.circuitDetailList[0].fieldImage}"),
                          )
                          ),
                        SizedBox(height: 10),
                largeText("${value.circuitDetailList[0].title}"),
                smallText("${value.circuitDetailList[0].body}",
                clr: AppColor.darkBlue,
                max: 2
                ),
                 SizedBox(height: 20),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      largeText("Today, 7:52 PM"),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardDetail()));
                        },
                        child: Row(
                          children: [
                            smallText("read more"),
                            Icon(Icons.arrow_forward_ios, color: Colors.red, size: 10,)
                          ],
                        ))
                    ],
                  ),
                ],
              );
            }
          ),
        ),
      ),
    );
  }

 
}