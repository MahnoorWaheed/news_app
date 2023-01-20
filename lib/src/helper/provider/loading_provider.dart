import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier{
bool _isInterview=false;

bool get isINTERVIEW => _isInterview;
bool _isIndustry= false;
bool get isINDUSTRY => _isIndustry;
bool _isProduct=false;
bool get isPRODUCT => _isProduct;

boolValue(bool isinterviewCall, isProductCall, isIndustryCall){
  // isIndustry=true;
  // isProduct=true;
  // isInterview=true;
  _isInterview=isinterviewCall!;
  _isIndustry=isIndustryCall!;
  _isProduct=isProductCall;
  notifyListeners();
}
}