import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/medium_data.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/models/artist_dto.dart';

class ArtistItemWidget extends StatefulWidget{
  final int index;
  final ArtistDto artist;
  final NavigatingSignal navigatingSignal;
  ArtistItemWidget({super.key, required this.index, required this.artist, required this.navigatingSignal});

  @override
  State<ArtistItemWidget> createState() => ArtistItemWidgetState();
}

class ArtistItemWidgetState extends State<ArtistItemWidget>{

  @override
  Widget build(BuildContext context){
    MediumData data = MediumData();
    data.setArtist(widget.artist);
    return InkWell(
      onTap: () => setState((){
              widget.navigatingSignal.setNavData(data);
              widget.navigatingSignal.setNavSignal(6);
              },
            ),
      borderRadius: BorderRadius.circular(15),
      child: Column(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("http://localhost:8080/user/image/id=${widget.artist.id}/account"),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.black12,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignCenter,
                  ),
                ),
              ),
          ),

          Expanded(
            flex: 0,
            child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              "Artist: ${widget.artist.userName}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          )
          )
        ],
      ),
    );
  }
} 