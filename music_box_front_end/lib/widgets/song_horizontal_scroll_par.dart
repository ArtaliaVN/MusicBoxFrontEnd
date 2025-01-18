import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/song_data.dart';
import 'package:music_box_front_end/widgets/song_item_widget.dart';

class SongHorizontalScrollPar extends StatefulWidget{
  const SongHorizontalScrollPar({super.key});

  @override 
  State<SongHorizontalScrollPar> createState() => SongHorizontalScrollParState();
}

class SongHorizontalScrollParState extends State<SongHorizontalScrollPar> {
  @override
  Widget build(BuildContext context) {
    final songData = SongData();
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,5,10,5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(mainAxisExtent: 250,maxCrossAxisExtent: 250, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1.0), 
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: songData.result.length,
          itemBuilder: (BuildContext context, int index) {
            return GridTile(child: SongItemWidget(index: index, result: songData,));
          },
        ),
      ),
    );
  }
}