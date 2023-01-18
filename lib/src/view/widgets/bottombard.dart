import 'dart:io';
import 'package:flutter/material.dart';
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
      
      body: Center(  
        child: _widgetOptions.elementAt(_selectedIndex),  
      ),  
      bottomNavigationBar: SizedBox(
        height: Platform.isIOS==true?75: 40,
        child: BottomNavigationBar(  
          backgroundColor: AppColor.lightgrey,
          items: const <BottomNavigationBarItem>[  
            BottomNavigationBarItem(  
              icon: Icon(Icons.home, size: 0,),  
              label: "News",  
              backgroundColor: AppColor.lightgrey  
            ),  
            BottomNavigationBarItem(  
              icon: Icon(Icons.search),  
              label: "Articles",  
              backgroundColor: AppColor.lightgrey 
            ),  
            BottomNavigationBarItem(  
              icon: Icon(Icons.person),  
              label: "Store",  
               backgroundColor: AppColor.lightgrey 
            ),
            BottomNavigationBarItem(  
              icon: Icon(Icons.home, size: 0,),  
              label: "Projects",  
              backgroundColor: AppColor.lightgrey  
            ),  
            BottomNavigationBarItem(  
              icon: Icon(Icons.home, size: 0,),  
              label: "Calculate",  
              backgroundColor: AppColor.lightgrey  
            ),    
          ],  
          type: BottomNavigationBarType.fixed,  
          currentIndex: _selectedIndex,  
          selectedItemColor: AppColor.darkBlue, 
          unselectedItemColor:AppColor.darkBlue , 
          iconSize: 0,  
          selectedFontSize: 17,
          unselectedFontSize: 17,
          onTap: _onItemTapped,  
          // elevation: 5  
        ),
      ),  
    );  
  }  
}  