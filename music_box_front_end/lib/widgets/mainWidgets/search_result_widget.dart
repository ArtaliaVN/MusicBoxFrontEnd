import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/service/remote_service.dart';
import 'package:music_box_front_end/widgets/searchPar/songs_extended_list_view_widget.dart';

class SearchResultWidget extends StatefulWidget {
  final NavigatingSignal navigatingSignal;
  const SearchResultWidget({super.key, required this.navigatingSignal});

  @override
  State<SearchResultWidget> createState() => SearchResultState();
}

class SearchResultState extends State<SearchResultWidget>{
  int selectedIndex = 0;
  List<SongDto> songs = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    songs = await RemoteService().getSongDtoListAll();
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
          padding: EdgeInsets.all(10),
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot){
              if(snapshot.connectionState == ConnectionState.done){
                return ListenableBuilder(
                    listenable: widget.navigatingSignal,
                    builder: (BuildContext context, Widget? child) {
                      return SongsExtendedListViewWidget(songs: songs, navigatingSignal: widget.navigatingSignal);
                    },
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