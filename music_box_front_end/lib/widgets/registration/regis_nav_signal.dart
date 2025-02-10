import 'package:flutter/material.dart';

class RegisNavSignal extends ChangeNotifier{
  int signal = 0;

  setNavSignal(int signal){
    this.signal = signal;
    notifyListeners();
  }
}