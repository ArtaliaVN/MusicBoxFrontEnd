import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/medium_data.dart';
import 'package:music_box_front_end/service/remote_service.dart';

class AccountManager extends ChangeNotifier {
  bool isLogin = false;
  bool get getIsLogin => isLogin;
  MediumData account = MediumData();
  RemoteService service = RemoteService();

  void setMediumData(String input) async{
    MediumData data = MediumData();
    data.artists = await service.getArtistDtoListByUserNameOrEmail(input, input);
    data.songs = await service.getSongDtoListByArtistName(input);
  }

  void login(){
    isLogin = true;
    notifyListeners();
  }

  void logout(){
    isLogin = false;
    notifyListeners();
  }
}