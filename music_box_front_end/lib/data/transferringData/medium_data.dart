import 'package:music_box_front_end/models/artist_dto.dart';
import 'package:music_box_front_end/models/song_dto.dart';

class MediumData {
  List<ArtistDto> artists = [];
  List<SongDto> songs = [];
  ArtistDto artist = ArtistDto(
    id: -1,
    email: "null",
    userName: "null",
    firstName: "null",
    lastName: "null",
    imageURL: "null",
    imageID: "null"
  );
  
  SongDto song = SongDto(
    id: -1,
    songName: "null",
    artistName: "null",
    imageURL: "null",
    imageID: "null",
    audioURL: "null",
    audioID: "null"
  );

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