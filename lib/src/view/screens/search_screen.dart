import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/src/view/widgets/reusable_widgets.dart';

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
 bool onsubmit=false;
  final _tabs = [
    'News',
    'Interview',
    'Circuits',
    'Events',
    'Forum-Topic',
    
    'Microcontroller',
    
    'Reviews',
    'Videos',
    'Tutorial',
  ];
  final _controllers = List.generate(9, (_) => TextEditingController());
  final _dataLists = List.generate(9, (_) => <dynamic>[]);

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < _tabs.length; i++) {
      fetchData(i, '').then((dataList) {
        setState(() {
          _dataLists[i] = dataList;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0,
         leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back, color: Colors.black,)),
         
          title: Center(
            child: reuableContainer(
              context,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 7, bottom: 15)
                ),
                textInputAction: TextInputAction.search,
                onSubmitted: (query) {
                  for (var i = 0; i < _tabs.length; i++) {
                    fetchData(i, query).then((dataList) {
                      setState(() {
                        _dataLists[i] = dataList;
                        onsubmit=false;
                      });
                    });
                  }
                },
              ),
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            labelColor: Colors.blue,
            // indicatorColor: Colors.white,
            tabs: _tabs.map((tab) => 
               Tab(text: tab)).toList(),
          ),
        ),
        body: TabBarView(
          children: _dataLists.map((dataList) {
            return ListView.builder(
              itemCount: dataList.length,
              itemBuilder: (context, index) {
                final item = dataList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      largeText(item['title'],),
                      HtmlWidget(
                       item['body']),
                    ],
                   
                  ),
                );
              },
            );
          }).toList(),
        )
        // bottomNavigationBar: MyNavigationBar(),
      ),

      
    );
  }
}

Future<List<dynamic>> fetchData(int apiIndex, String keyword) async {
  final apiUrl = [
    'http://45.33.23.205/circuitdigest_9/api-search-news',
    'http://45.33.23.205/circuitdigest_9/api-search-forum-interview',
    'http://45.33.23.205/circuitdigest_9/api-search-electronic-circuits',
    'http://45.33.23.205/circuitdigest_9/api-search-events',
    'http://45.33.23.205/circuitdigest_9/api-search-forum-topic',
    'http://45.33.23.205/circuitdigest_9/api-search-microcontroller',
    'http://45.33.23.205/circuitdigest_9/api-search-reviews',
    'http://45.33.23.205/circuitdigest_9/api-search-ti-videos',
    'http://45.33.23.205/circuitdigest_9/api-search-tutorial',
  ][apiIndex];
  final response = await http.get(Uri.parse("$apiUrl?keys=$keyword"));
  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body) as List<dynamic>;
    return jsonData;
  } else {
    throw Exception('Failed to load data');
  }
}
