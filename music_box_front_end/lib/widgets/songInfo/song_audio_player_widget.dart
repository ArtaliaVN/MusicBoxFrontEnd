import 'package:flutter/material.dart';

class SongAudioPlayerWidget extends StatefulWidget{
  const SongAudioPlayerWidget({super.key});

  @override
  State<SongAudioPlayerWidget> createState() => SongAudioPlayerState(); 
}

class SongAudioPlayerState extends State<SongAudioPlayerWidget>{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20,0,20,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //timer
                Text(
                  "00:00",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),

                Container(
                  constraints: BoxConstraints(
                    minWidth: 50,
                    maxWidth: 100,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.shuffle,
                        color: Colors.white,
                      ),

                      Icon(
                        Icons.play_circle,
                        color: Colors.white,
                      ),

                      Icon(
                        Icons.repeat,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),

                Text(
                  "00:00",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          Slider(
            min: 0,
            max: 100,
            value: 0, 
            activeColor: Colors.green,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}