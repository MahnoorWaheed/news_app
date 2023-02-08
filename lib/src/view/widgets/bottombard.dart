import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/src/view/screens/all_categories_Details.dart';
import 'package:news_app/src/view/screens/dashboardDetails.dart';
import 'package:news_app/src/view/widgets/reusable_widgets.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/src/view/screens/dashboard.dart';
import '../screens/demo.dart';

class MyNavigationBar extends StatefulWidget {  
  const MyNavigationBar ({Key? key}) : super(key: key);  
  
  @override  
  MyNavigationBarState createState() => MyNavigationBarState();  
}  
  
class MyNavigationBarState extends State<MyNavigationBar > {  
  int _selectedIndex = 0;  
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
    
    // Text('Home Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    // Text('Search Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
    // Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),  
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
                child: _widgetOptions.elementAt(_selectedIndex), 
               
              ),
            ),
            Container(
              height: Platform.isIOS==true?75: 45,
               width: double.infinity,
               color: AppColor.lightgrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:8.0, vertical: 0),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        _selectedIndex==0? Positioned(
                          bottom: 30,
                          child: indicatorContainer(0),):Text(""),
                        GestureDetector(
                         onTap: (){
                           log(_selectedIndex.toString());
                           _onItemTapped(0);
                         },
                         child: largeText("Interview")),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        _selectedIndex==1? Positioned(
                          bottom: 30,
                          child: indicatorContainer(1),):Text(""),
                        GestureDetector(
                         onTap: (){
                           log(_selectedIndex.toString());
                           _onItemTapped(1);
                         },
                         child: largeText("Articles")),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        _selectedIndex==2? Positioned(
                          bottom: 30,
                          child: indicatorContainer(2),):Text(""),
                        GestureDetector(
                         onTap: (){
                           log(_selectedIndex.toString());
                           _onItemTapped(2);
                         },
                         child: largeText("Store")),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        _selectedIndex==3? Positioned(
                          bottom: 30,
                          child: indicatorContainer(3),):Text(""),
                        GestureDetector(
                         onTap: (){
                           log(_selectedIndex.toString());
                           _onItemTapped(3);
                         },
                         child: largeText("Projects")),
                      ],
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        _selectedIndex==4? Positioned(
                          bottom: 30,
                          child: indicatorContainer(4),):Text(""),
                        GestureDetector(
                         onTap: (){
                           log(_selectedIndex.toString());
                           _onItemTapped(4);
                         },
                         child: largeText("Calculate")),
                      ],
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
      ),  
    );  
  }
   indicatorContainer(int index) {
    return index==0||index==1||index==2||index==3||index==4?Container(
                padding: EdgeInsets.zero,
                                 width: index==0? 70:index==1?60:index==2?40:index==3?60:70,height: 5,
                                 margin: EdgeInsets.zero,
                                 decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)
                )
                 ),
                 ):index==0;
  }  
}  

