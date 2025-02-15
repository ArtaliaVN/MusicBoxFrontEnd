import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MusicProvider extends ChangeNotifier{
  final AudioPlayer audioPlayer = AudioPlayer();
  
  Duration currentDuration = Duration.zero;
  Duration get getCurrentDuration => currentDuration;

  Duration totalDuration = Duration.zero;
  Duration get getTotalDuration => totalDuration;
  
  bool isPlaying = false;
  bool get getIsPlaying => isPlaying;

  MusicProvider(){
    listenToDuration();
  }

  void adjustVolumn(double volume){
    audioPlayer.setVolume(volume);
  }

  void listenToDuration(){
    audioPlayer.onDurationChanged.listen((newDuration) {
      totalDuration = newDuration;
      notifyListeners(); 
    });

    audioPlayer.onPositionChanged.listen((newPosition) {
      currentDuration = newPosition;
      notifyListeners();
    });

    audioPlayer.onPlayerComplete.listen((event) {});
  }

  void play(String songURL) async {
    await audioPlayer.stop();
    await audioPlayer.play(UrlSource(songURL));
    isPlaying = true;
    notifyListeners();
  }

  void resume() async {
    await audioPlayer.resume();
    isPlaying = true;
    notifyListeners();
  }

  void pause() async {
    await audioPlayer.pause();
    isPlaying = false;
    notifyListeners();
  }

  void pauseOrResume() async {
    if(isPlaying){
      pause();
    } else {
      resume();
    }
  }

  void seek (Duration position) async {
    await audioPlayer.seek(position);
  }
}