import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/my_home_page.dart';
import 'package:music_box_front_end/remote/remote_service.dart';
import 'package:music_box_front_end/widgets/song_item_widget.dart';

class SearchResultWidget extends StatefulWidget {
  const SearchResultWidget({super.key});

  @override
  State<SearchResultWidget> createState() => SearchResultState();
}

class SearchResultState extends State<SearchResultWidget>{
  int selectedIndex = 0;
  final NavigatingSignal signal = HomeScreenState.navigatingSignal;
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
        child: FutureBuilder(
          future: getData(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return ListenableBuilder(
                listenable: signal,
                    builder: (BuildContext context, Widget? child) {
                      return GridView.builder(
                            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 260, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 0.85),
                            scrollDirection: Axis.vertical,
                            itemCount: songs.length,
                            itemBuilder: (context, index) {
                                return GridTile(child: SongItemWidget(index: index, song: songs[index]));
                              }
                            ); 
                        },
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