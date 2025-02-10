class SongDto {
  int id;
  String songName;
  String artistName;
  String imageURL;
  String imageID;
  String audioURL;
  String audioID;

  SongDto({
    required this.id,
    required this.songName,
    required this.artistName,
    required this.imageURL,
    required this.imageID,
    required this.audioID,
    required this.audioURL
  });
}