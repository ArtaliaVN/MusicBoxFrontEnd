import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';
import 'package:music_box_front_end/models/song_model.dart';
import 'package:music_box_front_end/my_home_page.dart';

class SongDetailedPageWidget extends StatefulWidget{
  final SongModel song;
  final NavigatingSignal signal = HomeScreenState.navigatingSignal;
  SongDetailedPageWidget({super.key, required this.song,});

  @override
  State<SongDetailedPageWidget> createState() => SongDetailedPageState();
}

class SongDetailedPageState extends State<SongDetailedPageWidget>{
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Colors.black38,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: BlurryContainer(
        blur: 5,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
           Expanded(
            flex: 0,
             child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Icon(
                    Icons.arrow_back,
                  ),
                  onTap: () => {
                    widget.signal.toggleSignal(false),
                  },
                )
              ]
              ),
           ),
      
            Expanded(
              flex: 1,
              child: ListView(   
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Center(
                          child: Container(
                            constraints: BoxConstraints(
                              minHeight: 200,
                              minWidth: 200,
                              maxHeight: 400,
                              maxWidth: 400,
                            ),
                            margin: EdgeInsets.all(20),  
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(103, 244, 67, 54),
                            ),
                          ),
                        ),
    
                        Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.song.title,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                                ),
                            ),
    
                            Text(
                              "Artist: ${widget.song.artist}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                                ),
                            ),
                          ],
                        ),
                        ),
                      ],
                    ),
                  ),
                    
                    SizedBox(
                      child: Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Description:\n${widget.song.information}",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                ],
              ),
            ),
      
            Expanded(
              flex: 0,
              child: Container(),
            )
          ]
        ),  
      ),
    );
  }

  Widget playMusicWidget(){
    return Container();
  }
}