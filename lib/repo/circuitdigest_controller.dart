import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:news_app/src/helper/model/circui_digest_model.dart';
import 'package:http/http.dart' as http;

List<Cicuitdigest> circuitDetailList = [];
List<Cicuitdigest> circuitNewsDetailList = [];

bool isLoading = false;
Future<List<Cicuitdigest>> getInterviews() async {
  final reponse = await http
      .get(Uri.parse('http://45.33.23.205/circuitdigest_9/api-interviews'));

  List<Cicuitdigest> circuitDetailList = List<Cicuitdigest>.from(
      jsonDecode(reponse.body).map((x) => Cicuitdigest.fromJson(x)));
  log(reponse.body.toString());
  return circuitDetailList;
}

Future<List<Cicuitdigest>> getNews() async {
  final reponse =
      await http.get(Uri.parse('http://45.33.23.205/circuitdigest_9/api-news'));

  List<Cicuitdigest> circuitNewsDetailList = List<Cicuitdigest>.from(
      jsonDecode(reponse.body).map((x) => Cicuitdigest.fromJson(x)));
  log(reponse.body.toString());
  return circuitNewsDetailList;
}
