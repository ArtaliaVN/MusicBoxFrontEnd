import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/song_dto.dart';

class MusicProvider extends ChangeNotifier{
  final AudioPlayer audioPlayer = AudioPlayer();

  SongDto? currentSong;
  SongDto get getCurrentSong => currentSong!;
  
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

  void play(SongDto song) async {
    if(song != currentSong || currentSong == null){
      currentSong = song;
      await audioPlayer.stop();
      await audioPlayer.play(UrlSource("http://localhost:8080/song/audio/id=${currentSong?.id}/item"));
      isPlaying = true;
      notifyListeners();
    }
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