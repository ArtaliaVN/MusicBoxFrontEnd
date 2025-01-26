import 'dart:convert';
import 'package:music_box_front_end/models/artist_dto.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:http/http.dart' as http;

class RemoteService {

  artistToList(List<ArtistDto> artists, var jsonData){
    for(var eachArtist in jsonData){
      final artist = ArtistDto(
        id: eachArtist['id'], 
        artistName: eachArtist['artistName'], 
        artistInformation: eachArtist['artistInformation'], 
        email: eachArtist['email'], 
      );
      artists.add(artist);
    }
  }

  songToList(List<SongDto> songs, var jsonData){
    for(var eachSong in jsonData){
      final song = SongDto(
        id: eachSong['id'], 
        songLink: eachSong['songLink'],
        songLength: eachSong['songLength'],
        songName: eachSong['songName'],
        artistName: eachSong['artistName'], 
      );
      songs.add(song);
    }
  }

  Future getArtistDtoListByName(String name) async{
    List<ArtistDto> artists = [];
    var response = await http.get(Uri.http('localhost:8080', 'artist/get/artistName=$name'));
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      artistToList(artists, jsonData);
    }
    return artists;
  }

  Future getArtistDtoListAll() async{
    List<ArtistDto> artists = [];
    var response = await http.get(Uri.http('localhost:8080', 'artist/get/all'));
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      artistToList(artists, jsonData);
    }
    return artists;
  }

  Future getSongDtoListByName(String name) async{
    List<SongDto> songs = [];
    var response = await http.get(Uri.http('localhost:8080', 'song/get/songName=$name'));
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      songToList(songs, jsonData);
    }
    return songs;
  }

  Future getSongDtoListAll() async{
    List<SongDto> songs = [];
    var response = await http.get(Uri.http('localhost:8080', 'song/get/all'));
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      songToList(songs, jsonData);
    }
    return songs;
  }
}