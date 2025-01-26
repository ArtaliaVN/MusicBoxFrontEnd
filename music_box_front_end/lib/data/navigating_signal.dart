import 'package:flutter/material.dart';

class NavigatingSignal with ChangeNotifier {
  int navigatingSignal = 0;
  int get getNavSignal => navigatingSignal;

  int index = 0;
  int get getIndex => index;

  bool viewSelectedSignal = false;
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