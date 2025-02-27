import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/responsive_data.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/widgets/songInfo/music_provider.dart';
import 'package:music_box_front_end/widgets/songInfo/song_audio_player_widget.dart';
import 'package:provider/provider.dart';

class SongDetailedPageWidget extends StatefulWidget{
  final SongDto songDto;
  SongDetailedPageWidget({super.key, required this.songDto});

  @override
  State<SongDetailedPageWidget> createState() => SongDetailedPageState();
}

class SongDetailedPageState extends State<SongDetailedPageWidget>{
  @override
  void initState()  {
    super.initState();
    getData(); 
  }

  Future<ImageProvider?> getData() async {
    var image =  NetworkImage("http://localhost:8080/song/image/id=${widget.songDto.id}/item");
    return image;
  }

  @override
  Widget build(BuildContext context){
    context.read<MusicProvider>().play(widget.songDto);
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
                                  image: snapshot.data!, 
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
                                      widget.songDto.songName,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                        ),
                                    ),
                              
                                    Text(
                                      "Artist: ${widget.songDto.artistName}",
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
                                  image: snapshot.data!, 
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
                                      widget.songDto.songName,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                        ),
                                    ),
                              
                                    Text(
                                      "Artist: ${widget.songDto.artistName}",
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
                    child: SongAudioPlayerWidget(),
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