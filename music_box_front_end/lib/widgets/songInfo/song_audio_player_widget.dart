import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/responsive_data.dart';
import 'package:music_box_front_end/widgets/songInfo/music_provider.dart';
import 'package:provider/provider.dart';

class SongAudioPlayerWidget extends StatefulWidget{
  const SongAudioPlayerWidget({super.key});

  @override
  State<SongAudioPlayerWidget> createState() => SongAudioPlayerState(); 
}

class SongAudioPlayerState extends State<SongAudioPlayerWidget>{
  @override
  Widget build(BuildContext context) {
    final ResponsiveData responsiveData = ResponsiveData(context: context);
    return ListenableBuilder(
        listenable: context.watch<MusicProvider>(),
        builder: (BuildContext context, Widget? child) {
          return Visibility(
            visible: context.watch<MusicProvider>().currentSong != null,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,10,0,0),
                child: SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20,0,20,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //timer
                            Text(
                              "${formatTime(context.watch<MusicProvider>().currentDuration)} ${context.watch<MusicProvider>().currentSong?.songName}",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),

                            Container(
                              constraints: BoxConstraints(
                                minWidth: 50,
                                maxWidth: responsiveData.isLessThan600()?  100:200,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.shuffle,
                                    color: Colors.white,
                                  ),

                                  GestureDetector(
                                    onTap: context.watch<MusicProvider>().pauseOrResume,
                                    child: Icon(
                                          (context.watch<MusicProvider>().isPlaying)? Icons.pause_circle : Icons.play_circle,
                                          color: Colors.white,
                                        )
                                    ),

                                  Icon(
                                    Icons.repeat,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),

                            Text(
                              formatTime(context.watch<MusicProvider>().totalDuration),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),

                      Slider(
                        min: 0,
                        max: context.watch<MusicProvider>().totalDuration.inMilliseconds.toDouble(),
                        value: context.watch<MusicProvider>().currentDuration.inMilliseconds.toDouble(),
                        activeColor: Colors.green,
                        onChanged: (double double) {},

                        onChangeEnd: (double double)  async {
                          context.read<MusicProvider>().seek(Duration(milliseconds: double.toInt()));
                        },
                      )
                    ],
                  ),
                ),
              )
          );
        }
    );
  }

  String formatTime(Duration duration){
    String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2,"0");
    String formatTime = "${duration.inMinutes}:$twoDigitSeconds";
    return formatTime;
  }
}