import 'dart:convert';
import 'package:music_box_front_end/models/artist_dto.dart';
import 'package:music_box_front_end/models/artist_sending_dto.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:http/http.dart' as http;
import 'package:music_box_front_end/models/song_sending_dto.dart';

class RemoteService {
  artistToList(List<ArtistDto> artists, var jsonData){
    for(var eachArtist in jsonData){
      final artist = ArtistDto(
        id: eachArtist['id'], 
        email: eachArtist['email'],
        userName: eachArtist['userName'], 
        firstName: eachArtist['firstName'], 
        lastName: eachArtist['lastName'], 
        imageURL: eachArtist['imageURL'], 
        imageID: eachArtist['imageID'], 
      );
      artists.add(artist);
    }
  }

  songToList(List<SongDto> songs, var jsonData){
    for(var eachSong in jsonData){
      final song = SongDto(
        id: eachSong['id'], 
        songName: eachSong['songName'],
        artistName: eachSong['artistName'],
        imageURL: eachSong['imageURL'],
        imageID: eachSong['imageID'], 
        audioURL: eachSong['audioURL'],
        audioID: eachSong['audioID']
      );
      songs.add(song);
    }
  }

  postSong(SongSendingDto dto) async {
    var response = await http.post(
      Uri.https('localhost:8080', 'song'),
      headers: <String, String>{
        'Content-type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'songName': dto.songName,
        'artistName': dto.artistName,
        'user_id': dto.artistId,
      })
    );
    print(response.body);
  }

  postArtist(ArtistSendingDto dto) async {
    var response = await http.post(
      Uri.http('localhost:8080', 'user'),
      headers: <String, String>{
        'Content-type': 'application/json',
      },
      body: jsonEncode(<String, String>{
            'email': dto.email,
            'userName': dto.userName,
            'firstName': dto.firstName,
            'lastName': dto.lastName,
            'password': dto.password,
          }
        ),
      );
    print(response.body);
  }

  Future getArtistDtoListByName(String name) async{
    List<ArtistDto> artists = [];
    var response = await http.get(Uri.http('localhost:8080', 'user/username=$name/account'));
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      artistToList(artists, jsonData);
    }
    return artists;
  }

  Future getArtistDtoListByEmail(String email) async{
    List<ArtistDto> artists = [];
    var response = await http.get(Uri.http('localhost:8080', 'user/email=$email/account'));
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      artistToList(artists, jsonData);
    }
    return artists;
  }

  Future getArtistDtoListAll() async{
    List<ArtistDto> artists = [];
    var response = await http.get(Uri.http('localhost:8080', 'user/accounts'));
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      artistToList(artists, jsonData);
    }
    return artists;
  }

  Future getSongDtoListByName(String name) async{
    List<SongDto> songs = [];
    var response = await http.get(Uri.http('localhost:8080', 'song/songName=$name/account'));
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      songToList(songs, jsonData);
    }
    return songs;
  }

  Future getSongDtoListAll() async{
    List<SongDto> songs = [];
    var response = await http.get(Uri.http('localhost:8080', 'song/items'));
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      songToList(songs, jsonData);
    }
    return songs;
  }

  Future<bool> emailIsNotExist(String email) async{
    List<ArtistDto> artistListByEmail = await getArtistDtoListByEmail(email);
    if(artistListByEmail.isNotEmpty){
      return false;
    }
    return true;
  }

  Future<bool> userNameIsNotExist(String userName) async{
    List<ArtistDto> artistListByName = await getArtistDtoListByName(userName);
    if(artistListByName.isNotEmpty){
      return false;
    }
    return true;
  }
}