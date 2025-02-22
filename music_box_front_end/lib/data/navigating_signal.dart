import 'package:flutter/material.dart';

class NavigatingSignal with ChangeNotifier {
  int navigatingSignal = 0;
  int get getNavSignal => navigatingSignal;

  setNavSignal(int returnSignal){
    navigatingSignal = returnSignal;
    notifyListeners();
  }
}