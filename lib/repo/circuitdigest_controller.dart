import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_app/src/helper/model/article_model.dart';
import 'package:news_app/src/helper/model/circui_digest_model.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/src/helper/model/electronic_circuit_model.dart';
import 'package:news_app/src/helper/model/event_model.dart';
import 'package:news_app/src/helper/model/forum_model.dart';
import 'package:news_app/src/helper/model/micro_model.dart';
import 'package:news_app/src/helper/model/news_model.dart';
import 'package:news_app/src/helper/model/review_model.dart';
import 'package:news_app/src/helper/model/tutorial_model.dart';
import 'package:news_app/src/helper/model/videos_model.dart';



List<Cicuitdigest> circuitDetailList=[];
List<NewsModel> newsList=[];
  
  bool isLoading = false;
 Future<List<Cicuitdigest>> getInterviews() async {
    final reponse = await http.get(
      Uri.parse('http://45.33.23.205/circuitdigest_9/api-interviews'));

    List<Cicuitdigest> circuitDetailList = 
    List<Cicuitdigest>.from(jsonDecode(reponse.body).map((x) => Cicuitdigest.fromJson(x)));
    log(reponse.body.toString());
    return circuitDetailList;
    
}

Future<List<NewsModel>> getNews() async {
    final reponse = await http.get(
      Uri.parse('http://45.33.23.205/circuitdigest_9/api-news'));

    List<NewsModel> newsList = 
    List<NewsModel>.from(jsonDecode(reponse.body).map((x) => NewsModel.fromJson(x)));
    log(reponse.body.toString());
    return newsList;
    
}

Future<List<ElectronicCircuitModel>> getElectronicCircuits() async {
    final reponse = await http.get(
      Uri.parse('http://45.33.23.205/circuitdigest_9/api-electronic-circuits'));

    List<ElectronicCircuitModel> electronicCicuitsList = 
    List<ElectronicCircuitModel>.from(jsonDecode(reponse.body).map((x) => ElectronicCircuitModel.fromJson(x)));
    log(reponse.body.toString());
    return electronicCicuitsList;
    
}
Future<List<EventModel>> getEvents() async {
    final reponse = await http.get(
      Uri.parse('http://45.33.23.205/circuitdigest_9/api-events'));

    List<EventModel> eventList = 
    List<EventModel>.from(jsonDecode(reponse.body).map((x) => EventModel.fromJson(x)));
    log(reponse.body.toString());
    return eventList;
    
}

Future<List<ForumModel>> getForum() async {
    final reponse = await http.get(
      Uri.parse('http://45.33.23.205/circuitdigest_9/api-forum-topic'));

    List<ForumModel> forumList = 
    List<ForumModel>.from(jsonDecode(reponse.body).map((x) => ForumModel.fromJson(x)));
    log(reponse.body.toString());
    return forumList;
    
}

Future<List<MicroControllerModel>> getMicroControllers() async {
    final reponse = await http.get(
      Uri.parse('http://45.33.23.205/circuitdigest_9/api-microcontroller'));

    List<MicroControllerModel> microList = 
    List<MicroControllerModel>.from(jsonDecode(reponse.body).map((x) => MicroControllerModel.fromJson(x)));
    log(reponse.body.toString());
    return microList;
    
}
Future<List<ReviewModel>> getReview() async {
    final reponse = await http.get(
      Uri.parse('http://45.33.23.205/circuitdigest_9/api-reviews'));

    List<ReviewModel> reviewList = 
    List<ReviewModel>.from(jsonDecode(reponse.body).map((x) => ReviewModel.fromJson(x)));
    log(reponse.body.toString());
    return reviewList;
    
}

Future<List<VideoModel>> getVideo() async {
    final reponse = await http.get(
      Uri.parse('http://45.33.23.205/circuitdigest_9/api-ti-videos'));

    List<VideoModel> videoList = 
    List<VideoModel>.from(jsonDecode(reponse.body).map((x) => VideoModel.fromJson(x)));
    log(reponse.body.toString());
    return videoList;
    
}

Future<List<TutorialModel>> getTutorial() async {
    final reponse = await http.get(
      Uri.parse('http://45.33.23.205/circuitdigest_9/api-tutorial'));

    List<TutorialModel> tutorialList = 
    List<TutorialModel>.from(jsonDecode(reponse.body).map((x) => TutorialModel.fromJson(x)));
    log(reponse.body.toString());
    return tutorialList;
    
}

Future<List<ArticleModel>> getArticles() async {
    final reponse = await http.get(
      Uri.parse('http://45.33.23.205/circuitdigest_9/api-articles'));

    List<ArticleModel> articleList = 
    List<ArticleModel>.from(jsonDecode(reponse.body).map((x) => ArticleModel.fromJson(x)));
    log(reponse.body.toString());
    return articleList;
}

Future<List<EventModel>> getEvent() async {
    final reponse = await http.get(
      Uri.parse('http://45.33.23.205/circuitdigest_9/api-events'));

    List<EventModel> eventList = 
    List<EventModel>.from(jsonDecode(reponse.body).map((x) => EventModel.fromJson(x)));
    log(reponse.body.toString());
    return eventList;
    
}