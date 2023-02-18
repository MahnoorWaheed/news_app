// import 'package:flutter/material.dart';
// import 'package:news_app/repo/circuitdigest_controller.dart';
// import 'package:news_app/src/helper/model/news_model.dart';

// class NewsPageView extends StatefulWidget {
//   @override
//   _NewsPageViewState createState() => _NewsPageViewState();
// }

// class _NewsPageViewState extends State<NewsPageView> {
//   int _currentPage = 0;
//   List<NewsModel> _news = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchData(1);
//   }

//   void _fetchData(int page) {
//     fetchData(page).then((news) {
//       setState(() {
//         _news.addAll(news);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView.builder(
//         itemCount: _news.length,
//         onPageChanged: (index) {
//           setState(() {
//             _currentPage = index;
//           });
//         },
//         itemBuilder: (context, index) {
//           return Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: <Widget>[
//                   Text('Page ${index + 1}', style: TextStyle(fontSize: 24.0)),
//                   SizedBox(height: 16.0),
//                   Text(_news[index].title.toString(), style: TextStyle(fontSize: 18.0)),
//                   SizedBox(height: 16.0),
//                   Text(_news[index].body.toString(), style: TextStyle(fontSize: 16.0)),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),

//     );
//   }
// }
