import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/responsive_data.dart';
import 'package:music_box_front_end/models/artist_dto.dart';
import 'package:music_box_front_end/widgets/artistInfo/artist_vertical_song_list.dart';

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
                return ListView(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 500,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: responsiveData.isLessThan800()?
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: CircleAvatar(
                                  minRadius: 100,
                                  maxRadius: 150,
                                  backgroundImage: artistProfileImage,
                                ),
                              ),
                          
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    widget.artistDto.userName,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ]
                          )
                          :
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(20),
                                child: CircleAvatar(
                                  maxRadius: 150,
                                  backgroundImage: artistProfileImage,
                                ),
                              ),
                          
                              Flexible(
                                child: Container(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    widget.artistDto.userName,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 80,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    ArtistVerticalSongList(songList: widget.artistDto.songs),
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