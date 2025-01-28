import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/transferringData/medium_data.dart';
import 'package:music_box_front_end/data/transferringData/navigating_signal.dart';
import 'package:music_box_front_end/models/artist_dto.dart';

class ArtistItemWidget extends StatefulWidget{
  final int index;
  final ArtistDto artist;
  ArtistItemWidget({super.key, required this.index, required this.artist});

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
              NavigatingSignal().getNav.setNavData(data);
              NavigatingSignal().setNavSignal(5);
              },
            ),
      hoverColor: const Color.fromARGB(124, 255, 255, 255),
      borderRadius: BorderRadius.circular(15),
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 9, 31, 16),
            border: Border.all(
              color: Colors.black12,
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignCenter,
            ),
            borderRadius: BorderRadius.circular(15),
          ),

          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                Text(
                  widget.artist.artistInformation,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "Artist: ${widget.artist.artistName}",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          )
        ),
    );
  }
} 