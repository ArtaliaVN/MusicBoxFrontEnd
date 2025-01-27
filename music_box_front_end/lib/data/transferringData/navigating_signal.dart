import 'package:flutter/material.dart';

class NavigatingSignal with ChangeNotifier {
  static NavigatingSignal nav = NavigatingSignal();
  NavigatingSignal get getNav => nav;

  int navigatingSignal = 0;
  int get getNavSignal => navigatingSignal;

  int index = 0;
  int get getIndex => index;

  static bool viewSelectedSignal = false;
  bool get viewSignal => viewSelectedSignal;

  setNavSignal(int returnSignal){
    navigatingSignal = returnSignal;
    notifyListeners();
  }

  toggleSignal(bool returnSignal){
    viewSelectedSignal = returnSignal;
    notifyListeners();
  }

  setIndex(int index){
    this.index = index;
  }
}