import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/widgets/songInfo/song_par_widget.dart';

class ArtistVerticalSongList extends StatefulWidget{
  final List<SongDto> songList;
  ArtistVerticalSongList({super.key, required this.songList});

  @override
  State<ArtistVerticalSongList> createState() => ArtistVerticalSongListState();
}

class ArtistVerticalSongListState extends State<ArtistVerticalSongList>{
  @override
  build (BuildContext context) {
    return SizedBox(
      height: 300,
      width: 200,
      child: ListView.builder(
        itemCount:widget.songList.length,
        itemBuilder: (BuildContext context, int index) 
        { 
          return ListTile(title: SongParWidget(song: widget.songList[index]));
        },
      ),
    );
  }
}