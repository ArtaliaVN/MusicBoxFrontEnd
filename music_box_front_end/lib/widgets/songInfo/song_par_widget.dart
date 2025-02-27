import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/widgets/pageWidgets/song_detail_page.dart';

class SongParWidget extends StatefulWidget{
  final SongDto song;
  SongParWidget({super.key, required this.song});

  @override
  State<SongParWidget> createState() => SongParState();
}

class SongParState extends State<SongParWidget>{
  bool isHovered = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<ImageProvider?> getData() async {
    var image = NetworkImage(("http://localhost:8080/song/image/id=${widget.song.id}/item"));
      return image;
    }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => setState(() {
        isHovered = true;
      }),
      onExit: (e) => setState((){
        isHovered = false;
      }),
      child: GestureDetector(
        onTap: () => setState((){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SongDetailPage(songDto: widget.song,)),
            );
            },
          ),
        child: SizedBox(
          height: 50,
          child: Container(
            decoration: BoxDecoration(
              color:isHovered? Colors.black : Colors.black26,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 0,
                  child: FutureBuilder(
                    future: getData(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData){
                        return SizedBox.square(
                          dimension: 50,
                          child: Image(
                            image: snapshot.data!,
                            fit: BoxFit.fill,
                          ),
                        );
                      }
                      else{
                        return Center(child: CircularProgressIndicator());
                      }
                    }
                  )
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                  child: Text(
                    "Title: ${widget.song.songName}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
                Expanded(
                  flex: 0,
                  child: Visibility(
                    visible: isHovered,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5,0,5,0),
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 25,
                      ),
                    )
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}