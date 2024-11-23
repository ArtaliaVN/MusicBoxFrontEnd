
import 'package:flutter/widgets.dart';

class SongModel {
  
  final int ?songID;
  final String title;
  final String artist;
  final String information;
  final int view;
  final String lyrics;
  final int ?subscriberCount;
  final int ?upvoteCount;
  final int ?songURL;
  final Image ?songPoster;

  const SongModel(
    {
      required this.songID,
      required this.title,
      required this.artist,
      required this.information,
      required this.view,
      required this.lyrics,
      required this.subscriberCount,
      required this.upvoteCount,
      required this.songURL,
      required this.songPoster,
    }
  );
}