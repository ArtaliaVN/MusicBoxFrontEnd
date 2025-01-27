import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/widgets/songInfo/song_item_widget.dart';

class SongsExtendedListViewWidget extends StatefulWidget {
  final List<SongDto> songs;
  const SongsExtendedListViewWidget({super.key, required this.songs});
   
  @override
  State<SongsExtendedListViewWidget> createState() => SongsExtendedListViewWidgetState();
}

class SongsExtendedListViewWidgetState extends State<SongsExtendedListViewWidget>{
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 260, 
        crossAxisSpacing: 10, 
        mainAxisSpacing: 10, 
        childAspectRatio: 0.85),
      scrollDirection: Axis.vertical,
      itemCount: widget.songs.length,
      itemBuilder: (context, index) {
        return GridTile(
          child: SongItemWidget(
            index: index, 
            song: widget.songs[index]
          )
        );
      }
    ); 
  }
}