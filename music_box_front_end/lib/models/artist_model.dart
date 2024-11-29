import 'package:music_box_front_end/models/song_model.dart';

class ArtistModel {
  final int artistID;
  final String artistName;
  final String artistInformation;
  final int subscriperCount;
  final List<SongModel> songs;

  const ArtistModel(
    {
      required this.artistID, 
      required this.artistName, 
      required this.artistInformation, 
      required this.subscriperCount, 
      required this.songs,
    }
  );
}