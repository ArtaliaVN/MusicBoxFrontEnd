import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/artist_dto.dart';

class AccountService extends ChangeNotifier{
  bool isLogin = false;
  ArtistDto? artistAccount;
}