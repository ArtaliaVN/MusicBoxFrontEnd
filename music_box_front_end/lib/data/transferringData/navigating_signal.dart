import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/transferringData/history_list.dart';
import 'package:music_box_front_end/data/transferringData/medium_data.dart';
import 'package:music_box_front_end/data/transferringData/navigating_history.dart';

class NavigatingSignal with ChangeNotifier {
  static NavigatingSignal nav = NavigatingSignal();
  NavigatingSignal get getNav => nav;

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

  record(){
    HistoryList().customPush(true, NavigatingHistory(getData, navigatingSignal));
    print("Histories${HistoryList().getNavigatingHistories.toList()}");
    print("Future${HistoryList().getNavigatingFuture.toList()}");
    print("Length: ${HistoryList().getNavigatingHistories.length} _ Current index: ${NavigatingSignal().getNav.getNavSignal}");
  }
}