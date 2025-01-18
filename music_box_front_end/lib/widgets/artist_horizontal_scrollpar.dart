import 'package:flutter/material.dart';
import 'package:music_box_front_end/data/artist_data.dart';
import 'package:music_box_front_end/widgets/artist_item_widget.dart';

class ArtistHorizontalScrollpar extends StatefulWidget{
  const ArtistHorizontalScrollpar({super.key});

  @override 
  State<ArtistHorizontalScrollpar> createState() => ArtistHorizontalScrollparState();
}

class ArtistHorizontalScrollparState extends State<ArtistHorizontalScrollpar> {
  @override
  Widget build(BuildContext context) {
    final artistData = ArtistData();
    return SizedBox(
      height: 260,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10,5,10,5),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(mainAxisExtent: 250,maxCrossAxisExtent: 250, crossAxisSpacing: 10, mainAxisSpacing: 10, childAspectRatio: 1.0), 
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          itemCount: artistData.result.length,
          itemBuilder: (BuildContext context, int index) {
            return GridTile(child: ArtistItemWidget(artist: artistData, index: index,));
          },
        ),
      ),
    );
  }
}