class ArtistModel {
  final int artistID;
  final String artistName;
  final String artistInformation;
  final int subscriberCount;
  //final List<SongModel> songs;

  const ArtistModel(
    {
      required this.artistID, 
      required this.artistName, 
      required this.artistInformation, 
      required this.subscriberCount, 
    //  required this.songs,
    }
  );
}