import 'package:flutter/material.dart';
import 'package:music_box_front_end/models/song_dto.dart';
import 'package:music_box_front_end/widgets/pageWidgets/song_detail_page.dart';
import 'package:music_box_front_end/widgets/songInfo/music_provider.dart';

class SongParWidget extends StatefulWidget{
  final SongDto song;
  const SongParWidget({super.key, required this.song});

  @override
  State<SongParWidget> createState() => SongParState();
}

class SongParState extends State<SongParWidget>{
  late NetworkImage image;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    image = NetworkImage("http://localhost:8080/song/image/id=${widget.song.id}/item");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () => setState((){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SongDetailPage(musicProvider: MusicProvider(), songDto: widget.song,)),
                );
                },
              ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black26,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 0,
                child: FutureBuilder(
                  future: getData(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState == ConnectionState.done){
                      return SizedBox.square(
                        dimension: 50,
                        child: Image(
                          image: image,
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
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ),
    );
  }
}