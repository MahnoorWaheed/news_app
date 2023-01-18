import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:news_app/src/helper/model/circui_digest_model.dart';
import 'package:http/http.dart' as http;

// List<Cicuitdigest?>? cicuitdigestFromJson(String str) => 
// json.decode(str) == null ? [] : 
// List<Cicuitdigest?>.from(json.decode(str)!.map((x) => 
// Cicuitdigest.fromJson(x)));

// String cicuitdigestToJson(List<Cicuitdigest?>? data) => 
// json.encode(data == null ? [] : List<dynamic>.from(data!.map((x) => 
// x!.toJson())));


class CircuitProvider with ChangeNotifier {
  List<Cicuitdigest> circuitDetailList=[];
  // List<PaymentPlan> paymentPlanList=[];
  // String bannerID;
  bool isLoading = false;

  Future<void> floorPlanDetails(String id) async {
    isLoading = true;
    // update([3]);

    // bannerID = id;

    Map<String, dynamic> floorPlan = ({
      'type': 'getprojectFloorPlanByID',
      'value': '{ id:${jsonEncode(id)}}'
    });

    try {
      final circuitdigestResponse = await http.get(
          Uri.parse('http://45.33.23.205/circuitdigest_9/api-interviews'),
          
         );

      var circuitResponseDecode = await jsonDecode(circuitdigestResponse.body);

      var floorPlanFinalDecode =
          await jsonDecode(circuitResponseDecode['Value']);

      circuitDetailList = (floorPlanFinalDecode as List)
          .map((i) => Cicuitdigest.fromJson(i))
          .toList();
       notifyListeners();
       log(circuitDetailList.toString());
      // isLoading = false;
      // update([1]);
    } catch (e) {
      print('INSIDE CATCH ::::::::: $e');
      isLoading = false;
      // update([3]);
      notifyListeners();
    }
  }
}