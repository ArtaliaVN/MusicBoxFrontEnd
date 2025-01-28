import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/transferringData/navigating_signal.dart';

class ArtistDetailedPageWidget extends StatefulWidget{
  ArtistDetailedPageWidget({super.key,});
  @override
  createElement() {
    NavigatingSignal().getNav.record();
    return super.createElement();
  }

  @override
  State<ArtistDetailedPageWidget> createState() => ArtistDetailedPageState();
}

class ArtistDetailedPageState extends State<ArtistDetailedPageWidget>{
  @override
  Widget build(BuildContext context) {
    
    throw UnimplementedError();
  }
  
}