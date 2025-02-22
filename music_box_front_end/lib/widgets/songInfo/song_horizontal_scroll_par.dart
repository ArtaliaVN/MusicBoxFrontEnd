import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/service/remote_service.dart';
import 'package:music_box_front_end/widgets/songInfo/song_item_widget.dart';

class SongHorizontalScrollPar extends StatefulWidget{
  const SongHorizontalScrollPar({super.key});

  @override 
  State<SongHorizontalScrollPar> createState() => SongHorizontalScrollParState();
}

class SongHorizontalScrollParState extends State<SongHorizontalScrollPar> {
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
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,5,10,5),
        child: FutureBuilder(
          future: getData(), 
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done){
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(mainAxisExtent: 290,maxCrossAxisExtent: 250, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1.0), 
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: songs.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(child: SongItemWidget(song: songs[index]));
                },
              );
            }
            else{
              return Center(child: CircularProgressIndicator());
            }
          }
        )
      ),
    );
  }
}