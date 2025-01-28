import 'package:music_box_front_end/models/artist_dto.dart';
import 'package:music_box_front_end/models/song_dto.dart';

class MediumData {
  List<ArtistDto> artists = [];
  List<SongDto> songs = [];
  ArtistDto artist = ArtistDto(id: 0, artistName: "null", artistInformation: "null", email: "null");
  SongDto song = SongDto(id: 0, songLink: "null", songLength: 0, songName: "null", artistName: "null");

  setArtistData(List<ArtistDto> artists){
    this.artists = artists;
  }

  setArtist(ArtistDto artist){
    this.artist = artist;
  }

  setSongData(List<SongDto> songs){
    this.songs =songs;
  }

  setSong(SongDto song){
    this.song = song;
  }
}