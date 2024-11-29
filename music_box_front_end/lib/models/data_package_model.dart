import 'package:music_box_front_end/models/artist_model.dart';
import 'package:music_box_front_end/models/song_model.dart';

class DataPackageModel {
  final int? numberType;
  final String? stringType;
  final SongModel? songModelType;
  final ArtistModel? artistModelType;

  const DataPackageModel(this.numberType, this.stringType, this.songModelType, this.artistModelType);
}