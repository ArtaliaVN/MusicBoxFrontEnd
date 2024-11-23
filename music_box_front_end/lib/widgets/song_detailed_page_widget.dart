import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/song_model.dart';

class SongDetailedPageWidget extends StatefulWidget{
  final SongModel song;
  const SongDetailedPageWidget({super.key, required this.song});

  @override
  State<SongDetailedPageWidget> createState() => SongDetailedPageState();
}

class SongDetailedPageState extends State<SongDetailedPageWidget>{
  @override
  Widget build(BuildContext context){
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.circular(15),
      ),
      child: Column(
        children: [
          Container(

          )
        ],
      ),  
    );
  }
}