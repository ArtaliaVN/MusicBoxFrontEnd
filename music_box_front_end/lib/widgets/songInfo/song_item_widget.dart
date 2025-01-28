import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/transferringData/medium_data.dart';
import 'package:music_box_front_end/data/transferringData/navigating_signal.dart';
import 'package:music_box_front_end/models/song_dto.dart';

class SongItemWidget extends StatefulWidget{
 
  final SongDto song;
  SongItemWidget({super.key, required this.song});

  @override
  State<SongItemWidget> createState() => SongItemState(); 
}
class SongItemState extends State<SongItemWidget>{

  @override
  Widget build(BuildContext context) {
    MediumData data = MediumData();
    data.setSong(widget.song);
    return InkWell(
      onTap: () => setState((){
              NavigatingSignal().getNav.setNavData(data);
              NavigatingSignal().getNav.setNavSignal(4);
              },
            ),
      hoverColor: const Color.fromARGB(124, 255, 255, 255),
      borderRadius: BorderRadius.circular(15),
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 9, 31, 16),
            border: Border.all(
              color: Colors.black12,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
            borderRadius: BorderRadius.circular(15),
          ),

          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Text(
                  "Title: ${widget.song.songName}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Artist: ${widget.song.artistName}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          )
        ),
    );
  }
}