import 'package:flutter/material.dart';
import 'package:music_box_front_end/service/remote_service.dart';

class AccountManager extends ChangeNotifier {
  bool isLogin = false;
  bool get getIsLogin => isLogin;
  RemoteService service = RemoteService();

  void login(){
    isLogin = true;
    notifyListeners();
  }

  void logout(){
    isLogin = false;
    notifyListeners();
  }
}