import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/widgets/pageWidgets/song_detail_page.dart';

class SongItemWidget extends StatefulWidget{
  final SongDto song;
  SongItemWidget({super.key, required this.song});

  @override
  State<SongItemWidget> createState() => SongItemState(); 
}
class SongItemState extends State<SongItemWidget>{

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<ImageProvider?> getData() async {
    var image = NetworkImage("http://localhost:8080/song/image/id=${widget.song.id}/item");
    return image;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState((){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SongDetailPage(songDto: widget.song)),
              );
              },
            ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: snapshot.data!,
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(
                        color: Colors.black12,
                        style: BorderStyle.solid,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  );
                }
                else{
                  return Center(child: CircularProgressIndicator());
                }
              }
            )
              ),

              Expanded(
                flex: 0,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "Title: ${widget.song.songName}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Artist: ${widget.song.artistName}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        )
                      ],
                    ),
                  ),
              ),
        ],
      ),
    );
  }
}