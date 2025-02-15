import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/medium_data.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/models/song_dto.dart';

class SongItemWidget extends StatefulWidget{
  final NavigatingSignal navigatingSignal;
  final SongDto song;
  SongItemWidget({super.key, required this.song, required this.navigatingSignal});

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
              widget.navigatingSignal.setNavData(data);
              widget.navigatingSignal.setNavSignal(5);
              },
            ),
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("http://localhost:8080/song/image/id=${widget.song.id}/item"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black12,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                )
              ),

              Expanded(
                flex: 0,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "Title: ${widget.song.songName}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Artist: ${widget.song.artistName}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
              ),
        ],
      ),
    );
  }
}