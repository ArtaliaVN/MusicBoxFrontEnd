import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/data/song_data.dart';
import 'package:music_box_front_end/my_home_page.dart';

class SongItemWidget extends StatefulWidget{
  final NavigatingSignal signal = HomeScreenState.navigatingSignal;
  final int index;
  final SongData result;

  SongItemWidget({super.key, required this.index, required this.result});

  @override
  State<SongItemWidget> createState() => SongItemState(); 
}
class SongItemState extends State<SongItemWidget>{
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState((){
              widget.signal.setIndex(widget.index);
              widget.signal.setSong(widget.result.result[widget.signal.getIndex]);
              widget.signal.toggleSignal(true);   
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
                  widget.result.result[widget.index].title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Artist: ${widget.result.result[widget.index].artist} ",
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