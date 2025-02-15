import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/navigating_signal.dart';

class ArtistDetailedPageWidget extends StatefulWidget{
  final NavigatingSignal navigatingSignal;
  const ArtistDetailedPageWidget({super.key, required this.navigatingSignal});

  @override
  State<ArtistDetailedPageWidget> createState() => ArtistDetailedPageState();
}

class ArtistDetailedPageState extends State<ArtistDetailedPageWidget>{
  @override
  Widget build(BuildContext context) {
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
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadiusDirectional.circular(8),
          ),
          child: ListView(
            children: [
              Container(
               
              ),
            ],
          ),
        ),
      )
    );
  }
  
}