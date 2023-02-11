import 'package:flutter/material.dart';

class LoadingProvider extends ChangeNotifier{
bool _isInterview=false;

bool get isINTERVIEW => _isInterview;
bool _isNews= false;
bool get isNews => _isNews;
bool _iselecton=false;
bool get isELECTRON => _iselecton;
bool _isevent=false;
bool get isEVENT => _isevent;
bool _isforum=false;
bool get isFORUM => _isforum;
bool _isMicro=false;
bool get isMICRO => _isMicro;
bool _isReview=false;
bool get isREVIEW => _isReview;
bool _isVideo=false;
bool get isVIDEO => _isVideo;
bool _isTutorial=false;
bool get isTUTORIAL => _isTutorial;
bool _isArticle=false;
bool get isARTICLE => _isArticle;
boolValue(bool isnewsCall, isinterviewCall, 
isElectronCall, isEventCall, isForumCall,
isMicroCall, isReviewCall, isVideosCall,
 isTutorialCall, isArticleCall ){
  // isIndustry=true;
  // isProduct=true;
  // isInterview=true;
  _isInterview=isinterviewCall;
  _isNews=isnewsCall;
  _iselecton=isElectronCall;
  _isevent=isEventCall;
  _isforum=isForumCall;
  _isMicro=isMicroCall;
  _isReview=isReviewCall;
  _isVideo=isVideosCall;
  _isTutorial=isTutorialCall;
  _isArticle=isArticleCall;
  notifyListeners();
}
}