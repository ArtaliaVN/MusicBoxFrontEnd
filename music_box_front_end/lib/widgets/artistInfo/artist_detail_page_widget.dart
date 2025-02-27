import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/responsive_data.dart';
import 'package:music_box_front_end/models/artist_dto.dart';
import 'package:music_box_front_end/widgets/artistInfo/artist_vertical_song_list.dart';
import 'package:music_box_front_end/widgets/songInfo/song_audio_player_widget.dart';

class ArtistDetailedPageWidget extends StatefulWidget{
  final ArtistDto artistDto;
  ArtistDetailedPageWidget({super.key, required this.artistDto});

  @override
  State<ArtistDetailedPageWidget> createState() => ArtistDetailedPageState();
}

class ArtistDetailedPageState extends State<ArtistDetailedPageWidget>{
  late NetworkImage artistProfileImage;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    artistProfileImage = NetworkImage("http://localhost:8080/user/image/id=${widget.artistDto.id}/account");
  }

  @override
  Widget build(BuildContext context) {
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child: FutureBuilder(
            future: getData(),
            builder:(context, snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                return Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListView(
                        children: [
                          Center(
                            child: SizedBox(
                              height: 400,
                              child: Container(
                                child: responsiveData.isLessThan800()?
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(10,10,10,0),
                                      child: CircleAvatar(
                                        minRadius: 100,
                                        maxRadius: 150,
                                        backgroundImage: artistProfileImage,
                                      ),
                                    ),
                                
                                    Flexible(
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(10,0,10,0),
                                        child: Text(
                                          widget.artistDto.userName,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          softWrap: false,
                                          style: TextStyle(
                                            fontSize: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                      
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                          child: SizedBox(
                                            width: 60,
                                            height: 25,
                                            child: FloatingActionButton(
                                              onPressed: null,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(
                                                  color: Colors.white,
                                                  width: 1,
                                                )
                                              ),
                                              heroTag: "Follow1",
                                              backgroundColor: Colors.transparent,
                                              child: Text(
                                                "Follow",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                      
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                          child: SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: FloatingActionButton(
                                              onPressed: null,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(
                                                  color: Colors.white,
                                                  width: 1,
                                                )
                                              ),
                                              backgroundColor: Colors.transparent,
                                              hoverColor: Colors.green,
                                              hoverElevation: 1,
                                              tooltip: "Report",
                                              heroTag: 'Report1',
                                              child: Icon(
                                                Icons.flag,
                                                color: Colors.white,
                                                size:15,
                                              )
                                            ),
                                          ),
                                        ),
                      
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                          child: SizedBox(
                                            width: 25,
                                            height: 25,
                                            child: FloatingActionButton(
                                              onPressed: null,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10),
                                                side: BorderSide(
                                                  color: Colors.white,
                                                  width: 1,
                                                )
                                              ),
                                              backgroundColor: Colors.transparent,
                                              hoverColor: Colors.green,
                                              hoverElevation: 1,
                                              tooltip: "Share",
                                              heroTag: 'Share1',
                                              child: Icon(
                                                Icons.share,
                                                color: Colors.white,
                                                size:15,
                                              )
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ]
                                )
                                :
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(20,0,20,0),
                                      child: CircleAvatar(
                                        maxRadius: 150,
                                        backgroundImage: artistProfileImage,
                                      ),
                                    ),
                                
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(10,0,10,0),
                                            child: Text(
                                              widget.artistDto.userName,
                                              overflow: TextOverflow.ellipsis,
                                              softWrap: false,
                                              style: TextStyle(
                                                fontSize: 80,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                      
                                        Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                              child: SizedBox(
                                                width: 60,
                                                height: 25,
                                                child: FloatingActionButton(
                                                  onPressed: null,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    side: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    )
                                                  ),
                                                  backgroundColor: Colors.transparent,
                                                  heroTag: "Follow2",
                                                  child: Text(
                                                    "Follow",
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                      
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                              child: SizedBox(
                                                width: 25,
                                                height: 25,
                                                child: FloatingActionButton(
                                                  onPressed: null,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    side: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    )
                                                  ),
                                                  backgroundColor: Colors.transparent,
                                                  hoverColor: Colors.green,
                                                  hoverElevation: 1,
                                                  tooltip: "Report",
                                                  heroTag: 'Report2',
                                                  child: Icon(
                                                    Icons.flag,
                                                    color: Colors.white,
                                                    size:15,
                                                  )
                                                ),
                                              ),
                                            ),
                      
                                            Padding(
                                              padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                              child: SizedBox(
                                                width: 25,
                                                height: 25,
                                                child: FloatingActionButton(
                                                  onPressed: null,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(10),
                                                    side: BorderSide(
                                                      color: Colors.white,
                                                      width: 1,
                                                    )
                                                  ),
                                                  backgroundColor: Colors.transparent,
                                                  hoverColor: Colors.green,
                                                  hoverElevation: 1,
                                                  tooltip: "Share",
                                                  heroTag: 'Share2',
                                                  child: Icon(
                                                    Icons.share,
                                                    color: Colors.white,
                                                    size:15,
                                                  )
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20,0,0,0),
                            child: Text(
                              "Song",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          
                          ArtistVerticalSongList(songList: widget.artistDto.songs),
                        ],
                      ),
                    ),

                    Expanded(
                      flex: 0,
                      child: SongAudioPlayerWidget(),
                    )
                  ],
                );
              }
              else{
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      )
    );
  }
  
}