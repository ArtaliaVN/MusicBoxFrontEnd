import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/song_model.dart';

class NavigatingSignal with ChangeNotifier {
  int navigatingSignal = 0;
  int get getNavSignal => navigatingSignal;

  int index = 0;
  int get getIndex => index;

  bool viewSelectedSignal = false;
  bool get viewSignal => viewSelectedSignal;

  SongModel song = SongModel(songID: -1, title: "null", artist: "null", information: "null", view: 0, upvoteCount: 0, songURL: "null", songPoster: "null");
  SongModel get getSong => song;

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

  setSong(SongModel song){
    this.song = song;
  }

  resetSong(){
    song = SongModel(songID: -1, title: "null", artist: "null", information: "null", view: 0, upvoteCount: 0, songURL: "null", songPoster: "null");;
  }
}