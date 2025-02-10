import 'package:music_box_front_end/data/transferringData/navigating_history.dart';
import 'package:music_box_front_end/data/transferringData/navigating_signal.dart';
import 'package:stack/stack.dart';

class HistoryList {
  static Stack<NavigatingHistory> navigatingHistories = Stack();
  Stack<NavigatingHistory> get getNavigatingHistories => navigatingHistories;
  
  static Stack<NavigatingHistory> navigatingFutures = Stack();
  Stack<NavigatingHistory> get getNavigatingFutures => navigatingFutures;

  static bool isAllowed = true;

  customPush(NavigatingHistory currentTabs){
    if(isAllowed){
      navigatingHistories.push(currentTabs);
      navigatingFutures.clear();
    }
    else {
      isAllowed = true;
    }
  }

  setAllow(bool allow){
    isAllowed = allow;
  }

  forward(NavigatingSignal signal){
    if(navigatingFutures.length > 1){
      NavigatingHistory result = navigatingFutures.pop();
      navigatingHistories.push(result);    
      result = navigatingFutures.top();
      print("Histories${HistoryList().getNavigatingHistories.toList()}");
      print("Future${HistoryList().getNavigatingFutures.toList()}");
      signal.setNavData(result.mediumHistoryData);
      signal.setNavSignal(result.panelIndexAtThatMoment);
    }
  }

  backward(NavigatingSignal signal){
    if(navigatingHistories.length > 1){
      NavigatingHistory result = navigatingHistories.pop();
      navigatingFutures.push(result);
      result = navigatingHistories.top();
      print("Histories${HistoryList().getNavigatingHistories.toList()}");
      print("Future${HistoryList().getNavigatingFutures.toList()}");
      signal.setNavData(result.mediumHistoryData);
      signal.setNavSignal(result.panelIndexAtThatMoment);
    }
  }

  navigation(int state, NavigatingSignal signal){
    isAllowed = false;
    switch(state){
      case 1: 
        backward(signal);
      case 2:
        forward(signal);
    }
  }
}