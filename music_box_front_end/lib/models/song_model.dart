
class SongModel {
  
  final int songID;
  final String title;
  final String artist;
  final String information;
  final int view;
  final int upvoteCount;
  final String songURL;
  final String songPoster;

  const SongModel(
    {
      required this.songID,
      required this.title,
      required this.artist,
      required this.information,
      required this.view,
      required this.upvoteCount,
      required this.songURL,
      required this.songPoster,
    }
  );
}