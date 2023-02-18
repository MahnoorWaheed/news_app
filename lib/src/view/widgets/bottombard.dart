import 'dart:developer';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/src/helper/provider/loading_provider.dart';
import 'package:news_app/src/view/screens/all_categories_Details.dart';
import 'package:news_app/src/view/screens/dashboardDetails.dart';
import 'package:news_app/src/view/widgets/reusable_widgets.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/src/view/screens/dashboard.dart';
import 'package:provider/provider.dart';
import '../screens/demo.dart';

class MyNavigationBar extends StatefulWidget {  
  const MyNavigationBar ({Key? key}) : super(key: key);  
  
  @override  
  MyNavigationBarState createState() => MyNavigationBarState();  
}  
  
class MyNavigationBarState extends State<MyNavigationBar > {  
  int? _selectedIndex;  
  final _selectedItemColor = Colors.white;
final _unselectedItemColor = Colors.white30;
final _selectedBgColor = Colors.indigo;
final _unselectedBgColor = Colors.blue;
  static const List _widgetOptions = [  
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    Dashboard(),
    ];  
  
  
// Color _getItemColor(int index) =>
//     _selectedIndex == index ? _selectedItemColor : _unselectedItemColor;
  void _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  @override
  void initState() {
    // Provider.of<CircuitProvider>(context).floorPlanDetails;
    super.initState();
  }
  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      
      body: Container(  
        height: double.infinity,
        width: double.infinity,
        // child: _widgetOptions.elementAt(_selectedIndex),  
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            Expanded(
              child: Container(
                color: Colors.blue,
                // child: _widgetOptions.elementAt(_selectedIndex), 
              child: Dashboard(),
              ),
            ),
            Container(
              height: Platform.isIOS==true?75: 45,
               width: double.infinity,
               color: AppColor.lightgrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 0),
                child: SingleChildScrollView(
                  reverse: true,
                  physics: BouncingScrollPhysics(),
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  scrollDirection: Axis.horizontal,
                  child: Consumer<LoadingProvider>(
                    builder: (context, valu, _) {
                      return Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //  
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                             valu.isNews==true||_selectedIndex==0? Positioned(
                                bottom: 30,
                                child: indicatorContainer(0),):Text(""),
                              GestureDetector(
                               onTap: (){
                                 valu.boolValue(true, false, false, false, false, false, false, false, false, false);
                                 log(_selectedIndex.toString());
                                 _onItemTapped(0);
                               },
                               child: largeText("News")),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              valu.isINTERVIEW==true||_selectedIndex==1? Positioned(
                                bottom: 30,
                                child: indicatorContainer(1),):Text(""),
                              GestureDetector(
                               onTap: (){
                                 log(_selectedIndex.toString());
                                 _onItemTapped(1);
                                 valu.boolValue(false, true, false, false, false, false, false, false, false, false);
                              
                               },
                               child: largeText("Interview")),
                            ],
                          ),
                         
                          SizedBox(width: 10,),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              valu.isELECTRON==true||_selectedIndex==2? Positioned(
                                bottom: 30,
                                child: indicatorContainer(2),):Text(""),
                              GestureDetector(
                               onTap: (){
                                 log(_selectedIndex.toString());
                                 _onItemTapped(2);
                                 valu.boolValue(false, false, true, false, false, false, false, false, false, false);
                              
                               },
                               child: largeText("Circuits")),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              valu.isEVENT==true||_selectedIndex==3? Positioned(
                                bottom: 30,
                                child: indicatorContainer(3),):Text(""),
                              GestureDetector(
                               onTap: (){
                                 log(_selectedIndex.toString());
                                 _onItemTapped(3);
                                 valu.boolValue(false, false, false, true, false, false, false, false, false, false);
                              
                               },
                               child: largeText("Events")),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              valu.isFORUM==true||_selectedIndex==4? Positioned(
                                bottom: 30,
                                child: indicatorContainer(4),):Text(""),
                              GestureDetector(
                               onTap: (){
                                 log(_selectedIndex.toString());
                                 _onItemTapped(4);
                                 valu.boolValue(false, false, false, false, true, false, false, false, false, false);
                              
                               },
                               child: largeText("Forum-Topic")),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              valu.isMICRO==true||_selectedIndex==5? Positioned(
                                bottom: 30,
                                child: indicatorContainer(5),):Text(""),
                              GestureDetector(
                               onTap: (){
                                 log(_selectedIndex.toString());
                                 _onItemTapped(5);
                                 valu.boolValue(false, false, false, false, false, true, false, false, false, false);
                              
                               },
                               child: largeText("Microcontroller")),
                            ],
                          ),
                          SizedBox(width: 10,),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              valu.isREVIEW==true||_selectedIndex==6? Positioned(
                                bottom: 30,
                                child: indicatorContainer(6),):Text(""),
                              GestureDetector(
                               onTap: (){
                                 log(_selectedIndex.toString());
                                 _onItemTapped(6);
                                 valu.boolValue(false, false, false, false, false, false, true, false, false, false);
                              
                               },
                               child: largeText("Review")),
                            ],
                          ),
                           SizedBox(width: 10,),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              valu.isVIDEO==true||_selectedIndex==7? Positioned(
                                bottom: 30,
                                child: indicatorContainer(7),):Text(""),
                              GestureDetector(
                               onTap: (){
                                 log(_selectedIndex.toString());
                                 _onItemTapped(7);
                                 valu.boolValue(false, false, false, false, false, false, false, true, false, false);
                              
                               },
                               child: largeText("Video")),
                            ],
                          ),
                           SizedBox(width: 10,),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              valu.isTUTORIAL==true||_selectedIndex==8? Positioned(
                                bottom: 30,
                                child: indicatorContainer(8),):Text(""),
                              GestureDetector(
                               onTap: (){
                                 log(_selectedIndex.toString());
                                 _onItemTapped(8);
                                 valu.boolValue(false, false, false, false, false, false, false, false, true, false);
                              
                               },
                               child: largeText("Tutorial")),
                            ],
                          ),
                           SizedBox(width: 10,),
                          Stack(
                            clipBehavior: Clip.none,
                            children: [
                              valu.isARTICLE==true||_selectedIndex==9? Positioned(
                                bottom: 30,
                                child: indicatorContainer(9),):Text(""),
                              GestureDetector(
                               onTap: (){
                                 log(_selectedIndex.toString());
                                 _onItemTapped(9);
                                 valu.boolValue(false, false, false, false, false, false, false, false, false, true);
                              
                               },
                               child: largeText("Articles")),
                            ],
                          ),

                      
                        ],
                      );
                    }
                  ),
                ),
              ),
            ),
        
        
        ],
      ),
      ),  
    );  
  }
   indicatorContainer(int index) {
    return 
    index==0||index==1||index==2||index==3||index==4||index==5||
    index==6||
    index==7||
    index==8||
    index==9?
    Container(
                padding: EdgeInsets.zero,
                                 width: 40,height: 5,
                                 margin: EdgeInsets.zero,
                                 decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
                )
                 ),
                 )
                 :index==0;
  }  
}  

