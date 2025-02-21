import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/data/responsive_data.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/widgets/songInfo/music_provider.dart';
import 'package:music_box_front_end/widgets/songInfo/song_audio_player_widget.dart';

class SongDetailedPageWidget extends StatefulWidget{
  final MusicProvider musicProvider;
  final NavigatingSignal navigatingSignal;
  SongDetailedPageWidget({super.key, required this.navigatingSignal, required this.musicProvider});

  @override
  State<SongDetailedPageWidget> createState() => SongDetailedPageState();

}

class SongDetailedPageState extends State<SongDetailedPageWidget>{
  late final NetworkImage image;
  late final SongAudioPlayerWidget audioPlayerWidget;
  @override
  void initState()  {
    super.initState();
    getData();
  }

  getData() async {
    image =  NetworkImage("http://localhost:8080/song/image/id=${widget.navigatingSignal.data.song.id}/item");
    widget.musicProvider.play("http://localhost:8080/song/audio/id=${widget.navigatingSignal.data.song.id}/item");
    audioPlayerWidget = SongAudioPlayerWidget(musicProvider: widget.musicProvider);
  }

  @override
  void dispose() {
    widget.musicProvider.audioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    final SongDto song = widget.navigatingSignal.getData.song; 
    final ResponsiveData responsiveData = ResponsiveData(context: context);
    
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
        child: FutureBuilder(
          future: getData(),
          builder:(context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              return Container(
              decoration: BoxDecoration(
                color: Colors.black38,
                borderRadius: BorderRadiusDirectional.circular(8),
              ),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 400,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: responsiveData.isLessThan800()? Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: image, 
                                  fit: BoxFit.cover
                                ),
                              ),
                              child: SizedBox.square(
                                dimension: 300,
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
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
                        )
                        :
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: image, 
                                  fit: BoxFit.cover
                                ),
                              ),
                              child: SizedBox.square(
                                dimension: 350,
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: EdgeInsetsDirectional.symmetric(horizontal: 15),
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
                    ),
                  ),
                  
                  Expanded(
                    flex: 0,
                    child: audioPlayerWidget
                  ),
                ]
              ),
            );
          }
          else{
            return Center(child: CircularProgressIndicator());
          }
          }
        ),  
      ),
    );
  }
}