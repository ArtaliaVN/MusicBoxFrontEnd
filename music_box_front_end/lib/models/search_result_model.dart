
class SearchResultModel {
  
  final String title;
  final String artist;
  final String information;
  final int view;
  final String lyrics;

  const SearchResultModel(
    {
      required this.title,
      required this.artist,
      required this.information,
      required this.view,
      required this.lyrics,
    }
  );
}