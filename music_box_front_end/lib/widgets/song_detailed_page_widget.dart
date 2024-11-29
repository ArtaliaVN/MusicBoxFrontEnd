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
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(130, 255, 255, 255),
        borderRadius: BorderRadiusDirectional.circular(15),
        border: Border.all(
          style: BorderStyle.solid,
          width: 1,
          color: Colors.black12,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

         Expanded(
          flex: 0,
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.song.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
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
            child: Row(   
              children: [
                Expanded(
                  flex: 1,
                  child: Container(  
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color.fromARGB(103, 244, 67, 54),
                    ),
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.green,
                          size: 100,
                          ),
                      )
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Description:\n${widget.song.information}",
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
    );
  }

  Widget playMusicWidget(){
    return Container();
  }
}