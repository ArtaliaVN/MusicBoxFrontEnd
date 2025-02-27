import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/service/remote_service.dart';
import 'package:music_box_front_end/widgets/searchPar/songs_extended_list_view_widget.dart';
import 'package:music_box_front_end/widgets/songInfo/song_audio_player_widget.dart';

class SearchPageWidget extends StatefulWidget{
  const SearchPageWidget({super.key});

  @override
  State<SearchPageWidget> createState() => SearchState();
}

class SearchState extends State<SearchPageWidget>{
  final NavigatingSignal navigationSignal = NavigatingSignal();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<List<SongDto>?> getData() async{
    List<SongDto> songs = await RemoteService().getSongDtoListAll();
    return songs;
  }

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
        blur: 5,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListenableBuilder(
                            listenable: navigationSignal,
                            builder: (BuildContext context, Widget? child) {
                              return SongsExtendedListViewWidget(songs: snapshot.data!);
                            },
                          ),
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
            }
          ),
        ),
      ),
    );
  }
}