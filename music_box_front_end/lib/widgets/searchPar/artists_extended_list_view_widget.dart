import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/artist_dto.dart';
import 'package:music_box_front_end/widgets/artistInfo/artist_item_widget.dart';

class ArtistsExtendedListViewWidget extends StatefulWidget {
  final List<ArtistDto> artists;
  const ArtistsExtendedListViewWidget({super.key, required this.artists});
   
  @override
  State<ArtistsExtendedListViewWidget> createState() => ArtistsExtendedListViewWidgetState();
}

class ArtistsExtendedListViewWidgetState extends State<ArtistsExtendedListViewWidget>{
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 260, 
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10, 
        childAspectRatio: 0.85),
      scrollDirection: Axis.vertical,
      itemCount: widget.artists.length,
      itemBuilder: (context, index) {
        return GridTile(
          child: ArtistItemWidget(
            index: index, 
            artist: widget.artists[index]
          )
        );
      }
    ); 
  }
}