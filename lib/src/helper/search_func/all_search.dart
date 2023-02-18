 import 'dart:convert';
 import 'dart:io';
 import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
 
//  class AllSearchFunctions extends StatefulWidget {
//   const AllSearchFunctions({super.key});

//   @override
//   State<AllSearchFunctions> createState() => _AllSearchFunctionsState();
// }

// class _AllSearchFunctionsState extends State<AllSearchFunctions> {
//   List<dynamic>   searchMicroResults = [];
//   List<dynamic>   searchNewsResults = [];
//   List<dynamic>   searchinterviewResults = [];
//   List<dynamic>   searchcircuitResults = [];
//   List<dynamic>   searcheventResults = [];
//   List<dynamic>   searchforumResults=[];
//   List<dynamic>   searchReviewResults=[];
//   List<dynamic>   searchVideoResults=[];
//   List<dynamic>   searchTutorialResults=[];
//   List<dynamic>   searcharticleResults=[];
//   bool isvideosearch=false;
//   bool ismicro=false;
//   bool isnewssearch=false;
//   bool isinterviewsearch=false;
//   bool iscircuitsearch=false;
//   bool iseventsearch=false;
//   bool isforumsearch=false;
//   bool isReviewsearch=false;
//   bool istutorialsearch=false;
//   bool isarticlesearch=true;
//   var error;
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }

//   Future<void> fetchSearchResultsMicro(String query) async {
//     ismicro=true;
//   final url = Uri.parse('http://45.33.23.205/circuitdigest_9/api-search-articles?title=$query&body=$query');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
//     // print("My data $data");
//     setState(() {
//       searchMicroResults = data['items'];
//     });
//   } else {
//     throw Exception('Failed to fetch search results');
//   }
// }

// Future<void> fetchSearchResultsNews(String query) async {
//   final url = Uri.parse('http://45.33.23.205/circuitdigest_9/api-search-news?title=$query&body=$query');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);
// print("My data $data");
//     setState(() {
//       searchNewsResults = data;
//     });
//   } else {
//     setState(() {
//     searchNewsResults = []; // clear the search results if there was an error
//     error = 'Failed to fetch search results'; // set the error message
//     });
//   }
// }


// Future<void> fetchSearchResultsInterview(String query) async {
//   isinterviewsearch=true;
//   final url = Uri.parse('http://45.33.23.205/circuitdigest_9/api-search-forum-interview?title=$query&body=$query');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);

//     setState(() {
//       searchinterviewResults = data['items'];
//     });
//   } else {
//     throw Exception('Failed to fetch search results');
//   }
// }

//  Future<void> fetchSearchResultsCircuit(String query) async {
//   iscircuitsearch=true;
//   final url = Uri.parse('http://45.33.23.205/circuitdigest_9/api-search-electronic-circuits?title=$query&body=$query');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);

//     setState(() {
//       searchcircuitResults = data['items'];
//     });
//   } else {
//     throw Exception('Failed to fetch search results');
//   }
// }
//  Future<void> fetchSearchResultsEvent(String query) async {
//   iseventsearch=true;
//   final url = Uri.parse('http://45.33.23.205/circuitdigest_9/api-search-events?title=$query&body=$query');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);

//     setState(() {
//       searcheventResults = data['items'];
//     });
//   } else {
//     throw Exception('Failed to fetch search results');
//   }
// }
  
// Future<void> fetchSearchResultsForum(String query) async {
//   isforumsearch=true;
//   final url = Uri.parse('http://45.33.23.205/circuitdigest_9/api-search-forum-topic?title=$query&body=$query');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);

//     setState(() {
//       searchforumResults = data['items'];
//     });
//   } else {
//     throw Exception('Failed to fetch search results');
//   }}
// Future<void> fetchSearchResultsReview(String query) async {
//   isReviewsearch=true;
//   final url = Uri.parse('http://45.33.23.205/circuitdigest_9/api-search-reviews?title=$query&body=$query');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);

//     setState(() {
//       searchReviewResults = data['items'];
//     });
//   } else {
//     throw Exception('Failed to fetch search results');
//   }}

// Future<void> fetchSearchResultsVideos(String query) async {
//   isvideosearch=true;
//   final url = Uri.parse('http://45.33.23.205/circuitdigest_9/api-search-ti-videos?title=$query&body=$query');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);

//     setState(() {
//       searchVideoResults = data['items'];
//     });
//   } else {
//     throw Exception('Failed to fetch search results');
//   }}

//   Future<void> fetchSearchResultsTutorial(String query) async {
//   istutorialsearch=true;
//   final url = Uri.parse('http://45.33.23.205/circuitdigest_9/api-search-tutorial?title=$query&body=$query');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);

//     setState(() {
//       searchTutorialResults = data['items'];
//     });
//   } else {
//     throw Exception('Failed to fetch search results');
//   }}

// Future<void> fetchSearchResultsarticle(String query) async {
//   istutorialsearch=true;
//   final url = Uri.parse('http://45.33.23.205/circuitdigest_9/api-search-article?title=$query&body=$query');
//   final response = await http.get(url);

//   if (response.statusCode == 200) {
//     final data = json.decode(response.body);

//     setState(() {
//       searcharticleResults = data['items'];
//     });
//   } else {
//     throw Exception('Failed to fetch search results');
//   }}


// }

Future<List<dynamic>> fetchData(String keyword) async {
  final response = await http.get(Uri.parse("http://45.33.23.205/circuitdigest_9/api-search-news?key=$keyword"));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
 