import 'package:music_box_front_end/models/song_dto.dart';

class ArtistDto {
  int id;
  String email;
  String userName;
  String firstName;
  String lastName;
  String imageURL;
  String imageID;
  List<SongDto> songs = [];

  ArtistDto({
    required this.id,
    required this.email,
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.imageURL,
    required this.imageID
  });
}
