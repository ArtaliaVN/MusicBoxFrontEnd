import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/widgets/artistInfo/artist_horizontal_scroll_par.dart';
import 'package:music_box_front_end/widgets/songInfo/song_audio_player_widget.dart';
import 'package:music_box_front_end/widgets/songInfo/song_horizontal_scroll_par.dart';

class HomeWidget extends StatefulWidget{
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => HomeState();
}

class HomeState extends State<HomeWidget>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black38,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: BlurryContainer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  padding: const EdgeInsetsDirectional.all(2),
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints(
                        maxWidth: double.infinity,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular artists",
                            style: TextStyle(
                              color: Colors.white
                            ),
                            ),
                          Text(
                            "See more",
                            style: TextStyle(
                              color: Colors.white
                            ),
                          ),
                        ],
                      ),
                    ),
                    ArtistHorizontalScrollpar(),
                    Container(
                      //margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints(
                        maxWidth: double.infinity,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Popular tracks",
                            style: TextStyle(
                              color: Colors.white
                            ),
                            ),
                          Text(
                            "See more",
                            style: TextStyle(
                              color: Colors.white
                            ),
                            ),
                        ],
                      ),
                    ),
                    SongHorizontalScrollPar(),
                  ],
                ),
              ),

              Expanded(
                flex: 0,
                child: SongAudioPlayerWidget()
              )
            ],
          ),
        )
        )
    );
  }
}