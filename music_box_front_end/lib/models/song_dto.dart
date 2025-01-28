class SongDto {
  int id;
  String songLink;
  int songLength;
  String songName;
  String artistName;

  SongDto({
    required this.id,
    required this.songLink,
    required this.songLength,
    required this.songName,
    required this.artistName,
  });
}