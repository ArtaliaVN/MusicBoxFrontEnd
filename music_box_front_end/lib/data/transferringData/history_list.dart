import 'package:music_box_front_end/data/transferringData/navigating_history.dart';

class HistoryList {
  static List<NavigatingHistory> navigatingHistory = [];
  static int currentPosition = -1; 
  
  add(NavigatingHistory currentTab){
    currentPosition++;
    if(navigatingHistory.length < currentPosition){
      navigatingHistory.removeRange(currentPosition, navigatingHistory.length - 1);
    }
    navigatingHistory.add(currentTab);
  }

  NavigatingHistory backward(){
    if(currentPosition > 0){
      currentPosition--;
    }
    return navigatingHistory.elementAt(currentPosition);
  }

  NavigatingHistory forward(){
    if(currentPosition < navigatingHistory.length - 1){
      currentPosition++;
    }
    return navigatingHistory.elementAt(currentPosition);
  }
}