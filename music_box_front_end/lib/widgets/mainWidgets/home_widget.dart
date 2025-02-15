import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/widgets/artistInfo/artist_horizontal_scroll_par.dart';
import 'package:music_box_front_end/widgets/songInfo/song_horizontal_scroll_par.dart';

class HomeWidget extends StatelessWidget{
  final NavigatingSignal navigatingSignal;
  const HomeWidget({super.key, required this.navigatingSignal});
  
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
                padding: EdgeInsets.all(10),
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
              ArtistHorizontalScrollpar(navigatingSignal: navigatingSignal),
              Container(
                //margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
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
              SongHorizontalScrollPar(navigatingSignal: navigatingSignal,),
            ],
          ),
        )
        )
    );
  }
}