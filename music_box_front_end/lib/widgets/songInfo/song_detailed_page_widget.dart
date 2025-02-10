import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/transferringData/navigating_signal.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/widgets/songInfo/song_audio_player_widget.dart';

class SongDetailedPageWidget extends StatefulWidget{
  SongDetailedPageWidget({super.key});

  @override
  createElement() {
    NavigatingSignal().getNav.record();
    return super.createElement();
  }

  @override
  State<SongDetailedPageWidget> createState() => SongDetailedPageState();
}

class SongDetailedPageState extends State<SongDetailedPageWidget>{
  @override
  Widget build(BuildContext context){
    SongDto song = NavigatingSignal().getNav.getData.song;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black38,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: BlurryContainer(
        blur: 5,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            SizedBox(
              height: 400,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                    child: SizedBox.square(
                      dimension: 350,
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            song.songName,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                              ),
                          ),
                    
                          Text(
                            "Artist: ${song.artistName}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SongAudioPlayerWidget(),
          ]
        ),  
      ),
    );
  }

  Widget playMusicWidget(){
    return Container();
  }
}