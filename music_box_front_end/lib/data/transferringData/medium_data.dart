import 'package:music_box_front_end/models/artist_dto.dart';
import 'package:music_box_front_end/models/song_dto.dart';

class MediumData {
  List<ArtistDto> artistData = [];
  List<SongDto> songData = [];

  setArtistData(List<ArtistDto> artistData){
    this.artistData = artistData;
  }

  setSongData(List<SongDto> songData){
    this.songData =songData;
  }
}