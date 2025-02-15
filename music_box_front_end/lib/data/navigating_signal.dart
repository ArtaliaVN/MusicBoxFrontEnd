import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/medium_data.dart';

class NavigatingSignal with ChangeNotifier {

  MediumData data = MediumData();
  MediumData get getData => data;

  int navigatingSignal = 0;
  int get getNavSignal => navigatingSignal;

  setNavSignal(int returnSignal){
    navigatingSignal = returnSignal;
    notifyListeners();
  }

  setNavData(MediumData returnData){
    data = returnData;
  }
}