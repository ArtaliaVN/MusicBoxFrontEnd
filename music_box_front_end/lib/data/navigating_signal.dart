import 'package:flutter/material.dart';

class NavigatingSignal with ChangeNotifier {
  int navigatingSignal = 0;
  int get signal => navigatingSignal;

  setSignal(int returnSignal){
    navigatingSignal = returnSignal;
    notifyListeners();
  }
}