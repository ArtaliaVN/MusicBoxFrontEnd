import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/widgets/artist_horizontal_scroll_par.dart';
import 'package:music_box_front_end/widgets/song_horizontal_scroll_par.dart';

class HomeWidget extends StatelessWidget{
  const HomeWidget({super.key});
  
  @override
  Widget build(Object context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black38,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: BlurryContainer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsetsDirectional.all(2),
            children: <Widget>[
              Container(
                //margin: EdgeInsets.all(10),
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular artists",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                    Text(
                      "See more",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                  ],
                ),
              ),
              ArtistHorizontalScrollpar(),
              Container(
                //margin: EdgeInsets.all(10),
                padding: EdgeInsets.fromLTRB(10,0,10,0),
                constraints: BoxConstraints(
                  maxWidth: double.infinity,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular tracks",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                    Text(
                      "See more",
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                  ],
                ),
              ),
              SongHorizontalScrollPar(),
            ],
          ),
        )
        )
    );
  }
}