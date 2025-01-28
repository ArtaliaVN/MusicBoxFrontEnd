import 'package:music_box_front_end/data/transferringData/navigating_history.dart';
import 'package:music_box_front_end/data/transferringData/navigating_signal.dart';
import 'package:stack/stack.dart';

class HistoryList {
  static Stack<NavigatingHistory> navigatingHistories = Stack();
  Stack<NavigatingHistory> get getNavigatingHistories => navigatingHistories;
  
  static Stack<NavigatingHistory> navigatingFutures = Stack();
  Stack<NavigatingHistory> get getNavigatingFuture => navigatingFutures;

  static bool isAllowed = true;

  customPush(bool isAllowed, NavigatingHistory currentTabs){
    if(isAllowed){
      navigatingHistories.push(currentTabs);
      navigatingFutures.clear();
    }
    else if(!isAllowed){
      navigatingFutures.push(currentTabs);
      isAllowed = true;
    }
  }

  forward(NavigatingSignal signal){
    if(navigatingFutures.isNotEmpty){
      isAllowed = false;
      NavigatingHistory result = navigatingFutures.pop();
      signal.setNavData(result.mediumHistoryData);
      signal.setNavSignal(result.panelIndexAtThatMoment);
    }
  }

  backward(NavigatingSignal signal){
    if(navigatingHistories.isNotEmpty){
      isAllowed = false;
      NavigatingHistory result = navigatingHistories.pop();
      signal.setNavData(result.mediumHistoryData);
      signal.setNavSignal(result.panelIndexAtThatMoment);
    }
  }

  navigation(int state, NavigatingSignal signal){
    switch(state){
      case 1: 
        backward(signal);
      case 2:
        forward(signal);
    }
  }
}