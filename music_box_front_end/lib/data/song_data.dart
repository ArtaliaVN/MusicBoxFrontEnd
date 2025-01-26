import 'package:music_box_front_end/models/song_dto.dart';

class SongData{
  var isLoaded = false;
  List<SongDto> songs;

  SongData({required this.songs});
}