class SongDto {
  final int id;
  final String songLink;
  final int songLength;
  final String songName;
  final String artistName;

  SongDto({
    required this.id,
    required this.songLink,
    required this.songLength,
    required this.songName,
    required this.artistName,
  });
}