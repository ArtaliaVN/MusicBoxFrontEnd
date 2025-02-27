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
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,5,10,5),
        child: FutureBuilder(
          future: getData(), 
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(mainAxisExtent: 250,maxCrossAxisExtent: 200, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1.0), 
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(child: SongItemWidget(song: snapshot.data![index]));
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