import 'package:flutter/material.dart';
import 'package:music_box_front_end/widgets/songInfo/music_provider.dart';

class SongAudioPlayerWidget extends StatefulWidget{
  final MusicProvider musicProvider;
  const SongAudioPlayerWidget({super.key, required this.musicProvider});

  @override
  State<SongAudioPlayerWidget> createState() => SongAudioPlayerState(); 
}

class SongAudioPlayerState extends State<SongAudioPlayerWidget>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //timer
                ListenableBuilder(
                  listenable: widget.musicProvider,
                  builder:(BuildContext context, Widget? child) {
                    return Text(
                    formatTime(widget.musicProvider.currentDuration),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  );}
                ),

                Container(
                  constraints: BoxConstraints(
                    minWidth: 50,
                    maxWidth: 200,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.shuffle,
                        color: Colors.white,
                      ),

                      GestureDetector(
                        onTap: widget.musicProvider.pauseOrResume,
                        child: ListenableBuilder(
                          listenable: widget.musicProvider,
                          builder: (BuildContext context, Widget? child) {
                            return Icon(
                            widget.musicProvider.getIsPlaying? Icons.pause_circle : Icons.play_circle,
                            color: Colors.white,
                          );},
                        ),
                      ),

                      Icon(
                        Icons.repeat,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),

                ListenableBuilder(
                  listenable: widget.musicProvider,
                  builder:(BuildContext context, Widget? child) {
                    return Text(
                    formatTime(widget.musicProvider.totalDuration),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  );}
                ),
              ],
            ),
          ),

          ListenableBuilder(
            listenable: widget.musicProvider,
            builder:(BuildContext context, Widget? child) {
              return Slider(
              min: 0,
              max: widget.musicProvider.totalDuration.inMilliseconds.toDouble(),
              value: widget.musicProvider.currentDuration.inMilliseconds.toDouble(), 
              activeColor: Colors.green,
              onChanged: (double double) {
            
              },

              onChangeEnd: (double double) {
                widget.musicProvider.seek(Duration(milliseconds: double.toInt()));
              },
            );}
          ),
        ],
      ),
    );
  }

  String formatTime(Duration duration){
    String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2,"0");
    String formatTime = "${duration.inMinutes}:$twoDigitSeconds";
    return formatTime;
  }
}