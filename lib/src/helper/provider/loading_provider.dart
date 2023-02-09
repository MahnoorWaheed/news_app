import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier{
bool _isInterview=false;

bool get isINTERVIEW => _isInterview;
bool _isNews= false;
bool get isNews => _isNews;
bool _isProduct=false;
bool get isPRODUCT => _isProduct;

boolValue(bool isinterviewCall, isProductCall, isIndustryCall){
  // isIndustry=true;
  // isProduct=true;
  // isInterview=true;
  _isInterview=isinterviewCall;
  _isNews=isIndustryCall!;
  _isProduct=isProductCall;
  notifyListeners();
}
}