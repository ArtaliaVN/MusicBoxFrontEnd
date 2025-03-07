import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/artist_dto.dart';
import 'package:music_box_front_end/service/remote_service.dart';
import 'package:music_box_front_end/widgets/artistInfo/artist_item_widget.dart';

class ArtistHorizontalScrollpar extends StatefulWidget{
  const ArtistHorizontalScrollpar({super.key});

  @override 
  State<ArtistHorizontalScrollpar> createState() => ArtistHorizontalScrollparState();
}

class ArtistHorizontalScrollparState extends State<ArtistHorizontalScrollpar> {

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<List<ArtistDto>?> getData() async{
    List<ArtistDto> artists = await RemoteService().getArtistDtoListAll();
    return artists;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,5,10,5),
        child: FutureBuilder(
          future: getData(), 
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(mainAxisExtent: 250,maxCrossAxisExtent: 250, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1.0), 
                scrollDirection: Axis.vertical,
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GridTile(child: ArtistItemWidget(index: index, artist: snapshot.data![index]));
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